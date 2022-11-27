{ pkgs
, ...
}: {
  home.packages = with pkgs;
    [
      bat
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
