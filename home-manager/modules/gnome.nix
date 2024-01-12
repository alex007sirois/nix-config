{pkgs, ...}: {
  home.packages = with pkgs.gnomeExtensions; [
    bluetooth-battery
  ];
  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface".color-scheme = "prefer-dark";
      "org/gnome/shell" = {
        disable-user-extensions = false;

        # `gnome-extensions list` for a list
        enabled-extensions = [
          "bluetooth-battery@michalw.github.com"
        ];
      };
    };
  };
}
