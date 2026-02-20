{
  flake.modules.nixos.system =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        brlaser
      ];
      services.avahi = {
        enable = true;
        nssmdns4 = true;
        openFirewall = true;
      };
      services.printing.enable = true;
    };
}
