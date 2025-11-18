{pkgs, ...}: {
  services = {
    displayManager.gdm.enable = true;
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
