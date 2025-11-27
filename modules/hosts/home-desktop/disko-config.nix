{config, ...}: {
  flake = {
    modules.nixos.home-desktop.imports = [config.flake.diskoConfigurations.home-desktop];
    diskoConfigurations.home-desktop = let
      fast-mount-options = [
        "noatime"
        "barrier=0"
        "data=writeback"
        "commit=60"
      ];
    in {
      disko.devices = {
        disk = {
          ssd = {
            type = "disk";
            device = "/dev/disk/by-id/nvme-Samsung_SSD_970_EVO_Plus_500GB_S4P2NF0M537923N";
            content = {
              type = "gpt";
              partitions = {
                boot = {
                  size = "500M";
                  type = "EF00";
                  content = {
                    type = "filesystem";
                    format = "vfat";
                    mountpoint = "/boot";
                  };
                };
                primary = {
                  size = "100%";
                  content = {
                    type = "lvm_pv";
                    vg = "hot";
                  };
                };
              };
            };
          };
          hdd1 = {
            type = "disk";
            device = "/dev/disk/by-id/ata-ST1000DM003-1ER162_Z4Y21B2A";
            content = {
              type = "gpt";
              partitions = {
                primary = {
                  size = "100%";
                  content = {
                    type = "lvm_pv";
                    vg = "cold";
                  };
                };
              };
            };
          };
          hdd2 = {
            type = "disk";
            device = "/dev/disk/by-id/ata-WDC_WD10EZEX-00WN4A0_WD-WCC6Y0AK8Y48";
            content = {
              type = "gpt";
              partitions = {
                primary = {
                  size = "100%";
                  content = {
                    type = "lvm_pv";
                    vg = "cold";
                  };
                };
              };
            };
          };
        };
        lvm_vg = {
          hot = {
            type = "lvm_vg";
            lvs = {
              root = {
                size = "15G";
                content = {
                  type = "filesystem";
                  format = "ext4";
                  mountpoint = "/";
                };
              };
              nix = {
                size = "250G";
                content = {
                  type = "filesystem";
                  format = "ext4";
                  mountpoint = "/nix";
                  mountOptions = fast-mount-options;
                };
              };
              home = {
                size = "200G";
                content = {
                  type = "filesystem";
                  format = "ext4";
                  mountpoint = "/home";
                };
              };
            };
          };
          cold = {
            type = "lvm_vg";
            lvs = {
              games = {
                size = "1.8T";
                lvm_type = "raid0";
                content = {
                  type = "filesystem";
                  format = "ext4";
                  mountpoint = "/mnt/games";
                  mountOptions = fast-mount-options;
                };
              };
            };
          };
        };
      };
    };
  };
}
