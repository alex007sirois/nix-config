{pkgs, ...}: {
  home.packages = with pkgs; [
    openssh
    ssh-copy-id
    ssh-tools
  ];
}
