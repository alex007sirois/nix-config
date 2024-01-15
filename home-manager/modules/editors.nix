{pkgs, ...}: {
  home.packages = with pkgs; [
    nodePackages.pyright
    ruff-lsp
    nodePackages.bash-language-server
    buf-language-server
    dockerfile-language-server-nodejs
    gopls
    vscode-langservers-extracted
    taplo
    yaml-language-server
    alejandra
    nil
  ];

  programs.helix = {
    enable = true;
    settings = {
      theme = "dark_plus";
      editor = {
        bufferline = "multiple";
        color-modes = true;
        cursorline = true;
        line-number = "relative";
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
        indent-guides = {
          render = true;
        };
        lsp = {
          display-messages = true;
          display-inlay-hints = true;
        };
      };
      keys = {
        normal = {
          X = ["extend_line_up" "extend_to_line_bounds"];
        };
        select = {
          X = ["extend_line_up" "extend_to_line_bounds"];
        };
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
    languages = {
      language-server = {
        ruff = {
          command = "ruff-lsp";
        };
      };
      language = [
        {
          name = "nix";
          formatter = {
            command = "alejandra";
            args = ["--quiet" "-"];
          };
          auto-format = true;
        }
        {
          name = "python";
          language-servers = ["pyright" "ruff"];
          auto-format = true;
        }
      ];
    };
  };
  home.sessionVariables.EDITOR = "hx";
}
