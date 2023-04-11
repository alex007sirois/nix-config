{pkgs, ...}: {
  services.xserver = {
    enable = true;
    displayManager.gdm = {
      enable = true;
      wayland = false;
    };
    desktopManager.gnome.enable = true;
  };
  environment.gnome.excludePackages = with pkgs; [
    gnome.gnome-terminal
    gnome.epiphany
  ];
}
