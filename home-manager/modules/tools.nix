{ pkgs
, ...
}: {
  home.packages = with pkgs;
    [
      aria
      coreutils-full
      curl
      choose
      dive
      doggo
      dua
      duf
      glances
      hyperfine
      iputils
      ouch
      ripgrep
      rsync
      rustscan
      viddy
      xh
      zellij
    ];
}
