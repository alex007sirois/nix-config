{ config, ... }:
{
  flake = {
    modules.nixos.pi-server.imports = [
      config.flake.diskoConfigurations.pi-server
    ];
    diskoConfigurations.pi-server =
      { config, lib, ... }:
      let
        firmwarePartition = lib.recursiveUpdate {
          priority = 1;
          type = "0700";
          attributes = [ 0 ];
          size = "1024M";
          content = {
            type = "filesystem";
            format = "vfat";
            mountOptions = [
              "noatime"
              "noauto"
              "x-systemd.automount"
              "x-systemd.idle-timeout=1min"
            ];
          };
        };
        espPartition = lib.recursiveUpdate {
          type = "EF00";
          attributes = [ 2 ];
          size = "1024M";
          content = {
            type = "filesystem";
            format = "vfat";
            mountOptions = [
              "noatime"
              "noauto"
              "x-systemd.automount"
              "x-systemd.idle-timeout=1min"
              "umask=0077"
            ];
          };
        };
      in
      {
        services.btrfs.autoScrub = {
          enable = true;
          interval = "monthly";
          fileSystems = [ "/" ];
        };
        fileSystems."/var/log".neededForBoot = true;
        disko.devices.disk.main = {
          type = "disk";
          device = "/dev/mmcblk0";
          content = {
            type = "gpt";
            partitions = {
              FIRMWARE = firmwarePartition {
                label = "FIRMWARE";
                content.mountpoint = "/boot/firmware";
              };
              ESP = espPartition {
                label = "ESP";
                content.mountpoint = "/boot";
              };
              system = {
                type = "8305";
                size = "100%";
                content = {
                  type = "btrfs";
                  extraArgs = [ "-f" ];
                  postCreateHook =
                    let
                      btrfs = config.disko.devices.disk.main.content.partitions.system.content;
                      makeBlankSnapshot = subvolume: ''
                        if ! btrfs subvolume show "${subvolume}-blank" > /dev/null 2>&1; then
                         btrfs subvolume snapshot -r "${subvolume}" "${subvolume}-blank"
                        fi
                      '';
                    in
                    ''
                      mountPoint=$(mktemp -d)
                      mount ${btrfs.device} "$mountPoint" -o subvol=/
                      trap 'umount "$mountPoint"; rm -rf "$mountPoint"' EXIT
                      ${makeBlankSnapshot "$mountPoint/rootfs"}
                    '';
                  subvolumes = {
                    "/rootfs" = {
                      mountpoint = "/";
                      mountOptions = [ "noatime" ];
                    };
                    "/nix" = {
                      mountpoint = "/nix";
                      mountOptions = [ "noatime" ];
                    };
                    "/home" = {
                      mountpoint = "/home";
                      mountOptions = [ "noatime" ];
                    };
                    "/log" = {
                      mountpoint = "/var/log";
                      mountOptions = [ "noatime" ];
                    };
                    "/swap" = {
                      mountpoint = "/.swapvol";
                      swap."swapfile" = {
                        size = "8G";
                        priority = 3;
                      };
                    };
                  };
                };
              };
              swap = {
                type = "8200";
                size = "9G";
                content = {
                  type = "swap";
                  resumeDevice = true;
                  priority = 2;
                };
              };
            };
          };
        };
      };
  };
}
