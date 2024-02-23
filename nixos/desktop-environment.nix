{pkgs, ...}: {
  services.xserver = {
    enable = true;
    excludePackages = with pkgs; [xterm];
    displayManager.gdm = {
      enable = true;
      wayland = false;
    };
    desktopManager.gnome.enable = true;
  };
  programs.dconf.enable = true;
  environment.gnome.excludePackages = with pkgs; [
    gnome.gnome-terminal
    gnome.epiphany
    gnome-console
  ];
}
