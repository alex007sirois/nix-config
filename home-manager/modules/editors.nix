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
      keys = {
        insert = {
          up = "no_op";
          down = "no_op";
          left = "no_op";
          right = "no_op";
          pageup = "no_op";
          pagedown = "no_op";
          home = "no_op";
          end = "no_op";
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
