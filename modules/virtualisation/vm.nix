{
  flake.modules.nixos.virtualisation =
    { pkgs, ... }:
    {
      user.groups = [
        "kvm"
        "libvirtd"
      ];

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
