{pkgs, ...}: {
  home.packages = with pkgs; [
    blackbox-terminal
  ];

  home.shellAliases.spawn = "blackbox -w $PWD -c $SHELL";
}
