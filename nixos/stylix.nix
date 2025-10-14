{
  pkgs,
  lib,
  inputs,
  ...
}: {
  imports = [inputs.stylix.nixosModules.stylix];

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
      package = adwaita-icon-theme;
    };
    fonts = let
      nerdfont = {
        name = "mononoki Nerd Font Mono";
        package = nerd-fonts.mononoki;
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
