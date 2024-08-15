{pkgs, ...}: {
  home.packages = with pkgs; [
    basedpyright
    ruff-lsp
    bash-language-server
    buf-language-server
    dockerfile-language-server-nodejs
    gopls
    vscode-langservers-extracted
    taplo
    yaml-language-server
    alejandra
    nil
    nixd
  ];

  stylix.targets.helix.enable = false;

  programs.helix = {
    enable = true;
    defaultEditor = true;
    ignores = [
      "!.dockerignore"
      "!.env*"
      "!.gitlint"
      "!.helix"
      "!.helm"
      "!*.toml"
      "!*.ya?ml"
    ];
    settings = {
      theme = "dark_plus";
      editor = {
        bufferline = "multiple";
        color-modes = true;
        cursorline = true;
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
        end-of-line-diagnostics = "hint";
        inline-diagnostics.cursor-line = "warning";
        indent-guides.render = true;
        lsp = {
          display-messages = true;
          display-inlay-hints = true;
        };
      };
      keys = {
        normal.X = ["extend_line_up" "extend_to_line_bounds"];
        select.X = ["extend_line_up" "extend_to_line_bounds"];
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
        ruff.command = "ruff-lsp";
        basedpyright.config.basedpyright = {
          disableOrganizeImports = true;
          analysis = {
            diagnosticMode = "workspace";
            diagnosticSeverityOverrides = let
              disabled = "none";
              ruff = disabled;
              info = "information";
              warning = "warning";
              # https://github.com/DetachHead/basedpyright/issues/555
              unreachable = info;
              deprecated = info;
              unused = info;
            in {
              reportCallInDefaultInitializer = ruff;
              reportPrivateUsage = ruff;
              reportUnusedImport = ruff;
              reportUnusedVariable = ruff;
              reportUnknownMemberType = disabled;
              reportUnusedCallResult = disabled;
              reportUnreachable = unreachable;
              reportUnusedClass = unused;
              reportUnusedFunction = unused;
              reportDeprecated = deprecated;
              reportInvalidCast = info;
              reportMissingModuleSource = warning;
              reportMissingTypeStubs = warning;
              reportPrivateLocalImportUsage = warning;
              reportUnknownArgumentType = warning;
              reportUnknownLambdaType = warning;
              reportUnknownParameterType = warning;
              reportUnknownVariableType = warning;
            };
          };
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
          language-servers = ["basedpyright" "ruff"];
          auto-format = true;
        }
      ];
    };
  };
}
