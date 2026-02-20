{
  flake.module.nixos.home-desktop =
    { pkgs, ... }:
    {
      stylix.image = "${pkgs.pantheon.elementary-wallpapers}/share/backgrounds/Sunset by the Pier.jpg";
    };
}
