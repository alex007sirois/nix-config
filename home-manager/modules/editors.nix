{...}: {
  programs.helix = {
    enable = true;
    settings = {
      theme = "monokai";
    };
    languages.language = [
      {
        name = "nix";
        formatter = {
          command = "alejandra";
          args = ["--quiet" "-"];
        };
      }
    ];
  };
  home.sessionVariables.EDITOR = "hx";
}
