{ pkgs
, ...
}: {
  home.packages = with pkgs;
    [
      bat
      fd
    ];

  programs.fzf = {
    enable = true;
    defaultCommand = "fd --follow --type file";
    fileWidgetCommand = "fd --follow --type file";
    changeDirWidgetCommand = "fd --follow --type directory";
  };

  home.shellAliases = {
    fzf = "fzf --preview 'file -b {}' --bind '?:preview:bat --style=numbers --color=always --line-range :500 {}'";
  };
}
