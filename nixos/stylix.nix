{
  pkgs,
  lib,
  stylix,
  ...
}: {
  imports = [stylix.nixosModules.stylix];

  stylix = with pkgs; {
    enable = lib.mkDefault true;
    # Alternatives: onedark classic-dark material-darker tokyo-city-dark seti
    base16Scheme = lib.mkDefault "${base16-schemes}/share/themes/onedark.yaml";
    image = lib.mkDefault "${pantheon.elementary-wallpapers}/share/backgrounds/Photo of Valley.jpg";
    polarity = "dark";
    opacity.terminal = 0.98;
    cursor = {
      name = "Adwaita";
      size = 24;
      package = gnome.adwaita-icon-theme;
    };
    fonts = let
      nerdfont = {
        name = "mononoki Nerd Font Mono";
        package = nerdfonts.override {fonts = ["Mononoki"];};
      };
      cantarell = {
        name = "cantarell";
        package = cantarell-fonts;
      };
    in {
      serif = cantarell;
      sansSerif = cantarell;
      monospace = nerdfont;
      emoji = nerdfont;
    };
  };
}
