{ pkgs
, ...
}: {
  home.packages = with pkgs;
    [
      micro
    ];

  programs.micro.enable = true;
  home.sessionVariables = {
    EDITOR = "micro";
  };
}
