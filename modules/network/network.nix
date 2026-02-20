{
  flake.modules.nixos.network =
    { pkgs, ... }:
    {
      user.groups = [ "networkmanager" ];
      networking.networkmanager = {
        enable = true;
        plugins = with pkgs; [ networkmanager-openvpn ];
      };
    };
}
