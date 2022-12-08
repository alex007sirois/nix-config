{ pkgs
, ...
}: {
  programs.firefox = {
    enable = true;
    package = pkgs.firefox.override
      {
        cfg = {
          # Gnome shell native connector
          enableGnomeExtensions = true;
        };
      };
  };
}
