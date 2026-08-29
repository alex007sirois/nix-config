{
  flake.modules = {
    homeManager.torrent =
      { pkgs, ... }:
      {
        home.packages = with pkgs; [
          fragments
        ];
      };
    nixos.torrent = {
      services.nordvpn.enable = true;
      user.groups = [ "nordvpn" ];
    };
  };
}
