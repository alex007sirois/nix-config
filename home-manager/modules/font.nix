{ pkgs
, ...
}: {
  home.packages = with pkgs;
    [
      (nerdfonts.override { fonts = [ "Mononoki" ]; })
    ];

  fonts.fontconfig.enable = true;
}
