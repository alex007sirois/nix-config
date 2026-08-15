{
  flake.modules.homeManager.nix =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        nh
        nix-output-monitor
        nvd
      ];
    };
  flake.modules.nixos.nix =
    { config, ... }:
    {
      nix.settings.trusted-users = [ config.user.username ];
    };
}
