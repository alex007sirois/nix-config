{
  pkgs,
  lib,
  stylix,
  ...
}: {
  imports = [stylix.nixosModules.stylix];

  stylix = with pkgs; {
    # Alternatives: onedark classic-dark material-darker tokyo-city-dark seti
    base16Scheme = lib.mkDefault "${base16-schemes}/share/themes/onedark.yaml";
    image = lib.mkDefault "${pantheon.elementary-wallpapers}/share/backgrounds/Photo of Valley.jpg";
    polarity = "dark";
  };
}
