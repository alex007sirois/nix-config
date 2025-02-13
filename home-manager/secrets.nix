{pkgs, ...}: {
  services = {
    gpg-agent = {
      enable = true;
      pinentryPackage = pkgs.pinentry-gnome3;
    };
  };
  programs = {
    password-store.enable = true;
    gpg.enable = true;
  };
}
