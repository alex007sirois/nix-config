{...}: {
  programs.helix = {
    enable = true;
    settings = {
      theme = "dark_plus";
      editor = {
        completion-replace = true;
        lsp = {
          display-messages = true;
          display-inlay-hints = true;
        };
      };
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
