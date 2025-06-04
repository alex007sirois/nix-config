{pkgs, ...}: {
  services = {
    gpg-agent = {
      enable = true;
      pinentry.package = pkgs.pinentry-gnome3;
    };
  };
  programs = {
    password-store.enable = true;
    gpg.enable = true;
  };
}
