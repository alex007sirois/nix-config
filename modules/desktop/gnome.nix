{
  flake.modules = {
    homeManager.desktop = {pkgs, ...}: {
      home.packages = with pkgs.gnomeExtensions; [
        bluetooth-battery-meter
      ];
      dconf = {
        enable = true;
        settings = {
          "org/gnome/desktop/interface".color-scheme = "prefer-dark";
          "org/gnome/shell" = {
            disable-user-extensions = false;

            # `gnome-extensions list` for a list
            enabled-extensions = [];
          };
        };
      };
    };
    nixos.desktop = {pkgs, ...}: {
      services = {
        displayManager.gdm.enable = true;
        desktopManager.gnome.enable = true;
      };
      programs = {
        dconf.enable = true;
        evolution = {
          enable = true;
          plugins = [pkgs.evolution-ews];
        };
        geary.enable = true;
      };
      environment.gnome.excludePackages = with pkgs; [
        gnome-terminal
        epiphany
        gnome-console
      ];
    };
  };
}
