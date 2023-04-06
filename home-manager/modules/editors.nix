{...}: {
  programs.helix = {
    enable = true;
    settings = {
      theme = "monokai";
    };
  };
  home.sessionVariables.EDITOR = "hx";
}
