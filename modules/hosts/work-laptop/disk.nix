{ config, ... }:
{
  flake = {
    modules.nixos.work-laptop = {
      imports = [ config.flake.diskoConfigurations.work-laptop ];

      boot.initrd.systemd.enable = true;
      boot.initrd.kernelModules = [
        # External USB keyboards
        "usbhid"
        "hid_generic"
        "hid"
        # Internal laptop keyboard ("AT Translated Set 2 keyboard" on the i8042 controller)
        "i8042"
        "atkbd"
      ];
      security.tpm2.enable = true;

      fileSystems."/" = {
        options = [
          "noatime"
          "nodiratime"
          "commit=60"
        ];
      };

      services.fstrim.enable = true;
    };
    diskoConfigurations.work-laptop = {
      disko.devices = {
        disk = {
          nvme0n1 = {
            type = "disk";
            device = "/dev/nvme0n1";
            content = {
              type = "gpt";
              partitions = {
                ESP = {
                  label = "boot";
                  type = "EF00";
                  size = "2G";
                  content = {
                    type = "filesystem";
                    format = "vfat";
                    mountpoint = "/boot";
                    mountOptions = [ "umask=0077" ];
                  };
                };
                luks = {
                  label = "system";
                  size = "100%";
                  content = {
                    name = "rootcrypted";
                    type = "luks";
                    settings = {
                      # Allow SSD TRIM at the cost of exposing allocation patterns.
                      allowDiscards = true;
                      # Requires separate TPM enrollment; otherwise prompts for the passphrase.
                      crypttabExtraOpts = [ "tpm2-device=auto" ];
                    };
                    extraFormatArgs = [
                      "--type=luks2"
                      "--pbkdf=argon2id"
                    ];
                    # Supply the decrypted agenix secret with nixos-anywhere --disk-encryption-keys.
                    passwordFile = "/run/luks-passphrase";
                    content = {
                      type = "filesystem";
                      format = "ext4";
                      mountpoint = "/";
                    };
                  };
                };
              };
            };
          };
        };
      };
    };
  };
}
