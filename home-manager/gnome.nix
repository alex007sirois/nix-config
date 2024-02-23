{pkgs, ...}: {
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
        enabled-extensions = [
          "Bluetooth-Battery-Meter@maniacx.github.com"
        ];
      };
    };
  };
}
