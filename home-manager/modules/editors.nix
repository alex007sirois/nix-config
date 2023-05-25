{...}: {
  programs.helix = {
    enable = true;
    settings = {
      theme = "dark_plus";
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
