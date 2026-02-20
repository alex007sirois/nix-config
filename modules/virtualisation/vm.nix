{
  flake.modules.nixos.virtualisation =
    { pkgs, ... }:
    {
      virtualisation.libvirtd.enable = true;
      virtualisation.spiceUSBRedirection.enable = true;
      security.polkit.enable = true;
      programs.dconf.enable = true;

      environment.systemPackages = with pkgs; [
        gnome-boxes
        spice-gtk
      ];
    };
}
