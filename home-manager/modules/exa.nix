{ pkgs
, ...
}: {
  home.packages = with pkgs;
    [
      exa
    ];

  home.shellAliases = {
    exa = "exa --classify --group-directories-first --icons --time-style=long-iso";
  };
}
