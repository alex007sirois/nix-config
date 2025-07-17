{pkgs, ...}: {
  services = {
    xserver = {
      enable = true;
      excludePackages = with pkgs; [xterm];
    };
    displayManager.gdm = {
      enable = true;
      wayland = false;
    };
    desktopManager.gnome.enable = true;
  };
  programs = {
    dconf.enable = true;
    evolution = {
      enable = true;
      plugins = [pkgs.evolution-ews];
    };
  };
  environment.gnome.excludePackages = with pkgs; [
    gnome-terminal
    epiphany
    gnome-console
  ];
}
