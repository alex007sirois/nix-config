{ pkgs
, ...
}: {
  home.packages = with pkgs;
    [
      fast-ssh
      openssh
      ssh-copy-id
      ssh-tools
    ];
}
