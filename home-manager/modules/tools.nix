{ pkgs
, ...
}: {
  home.packages = with pkgs;
    [
      aria
      bat
      coreutils-full
      curl
      choose
      delta
      dive
      doggo
      dua
      duf
      exa
      fd
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
