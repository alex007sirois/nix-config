{ pkgs
, ...
}: {
  home.packages = with pkgs;
    [
      less
      lesspipe
    ];

  programs.less.enable = true;
  programs.lesspipe.enable = true;
  home.sessionVariables.PAGER = "less";
}
