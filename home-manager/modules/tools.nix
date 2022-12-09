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
      fx
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
