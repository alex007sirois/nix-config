{pkgs, ...}: let
  helix-gpt = pkgs.writeShellScriptBin "helix-gpt" ''
    if [ -z "$COPILOT_API_KEY" ]; then
      export COPILOT_API_KEY="$(pass show Copilot/api_key)"
    fi
    exec ${pkgs.helix-gpt}/bin/helix-gpt "$@"
  '';
in {
  home.packages = with pkgs; [
    basedpyright
    ruff
    bash-language-server
    buf
    dockerfile-language-server-nodejs
    gopls
    vscode-langservers-extracted
    taplo
    yaml-language-server
    alejandra
    nil
    nixd
    helix-gpt

    tailwindcss-language-server
    vue-language-server
    typescript-language-server
    dprint
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
        rust-analyzer = {
          config.rust-analyzer = {
            check.command = "clippy";
            imports = {
              granularity.group = "module";
              prefix = "self";
            };
          };
        };
        basedpyright.config.basedpyright = {
          disableOrganizeImports = true;
          analysis = {
            diagnosticMode = "workspace";
            diagnosticSeverityOverrides = let
              disabled = "none";
              ruff = disabled;
              info = "information";
              warning = "warning";
              unreachable = "unreachable";
              deprecated = "deprecated";
              unused = "unused";
            in {
              reportCallInDefaultInitializer = ruff;
              reportPrivateUsage = ruff;
              reportUnusedImport = ruff;
              reportUnusedVariable = ruff;
              reportUnusedParameter = ruff;
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
        gpt = {
          command = "helix-gpt";
          args = ["--handler" "copilot"];
        };
        typescript-language-server.config = {
          plugins = [
            {
              name = "@vue/typescript-plugin";
              location = "${pkgs.vue-language-server}/lib/node_modules/@vue/language-server/";
              languages = ["vue"];
            }
          ];
          vue.inlayHints = {
            includeInlayEnumMemberValueHints = true;
            includeInlayFunctionLikeReturnTypeHints = true;
            includeInlayFunctionParameterTypeHints = true;
            includeInlayParameterNameHints = "all";
            includeInlayParameterNameHintsWhenArgumentMatchesName = true;
            includeInlayPropertyDeclarationTypeHints = true;
            includeInlayVariableTypeHints = true;
          };
        };
      };
      language = [
        {
          name = "nix";
          language-servers = ["nil" "nixd" "gpt"];
          formatter = {
            command = "alejandra";
            args = ["--quiet" "-"];
          };
          auto-format = true;
        }
        {
          name = "python";
          language-servers = ["basedpyright" "ruff" "gpt"];
          auto-format = true;
        }
        {
          name = "go";
          language-servers = ["gopls" "golangci-lint-lsp" "gpt"];
        }
        {
          name = "rust";
          language-servers = ["rust-analyzer" "gpt"];
        }
        {
          name = "vue";
          formatter = {
            command = "dprint";
            args = ["fmt" "--stdin" "vue"];
          };
          language-servers = ["vuels" "typescript-language-server" "tailwindcss-ls" "gpt"];
        }
      ];
    };
  };
}
