{
  flake.modules.homeManager.terminal =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        basedpyright
        ruff
        bash-language-server
        buf
        dockerfile-language-server
        gopls
        vscode-langservers-extracted
        taplo
        yaml-language-server

        nixfmt
        nixfmt-tree
        nil
        nixd

        typescript-language-server
      ];

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
            normal.X = [
              "extend_line_up"
              "extend_to_line_bounds"
            ];
            select.X = [
              "extend_line_up"
              "extend_to_line_bounds"
            ];
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
                diagnosticSeverityOverrides =
                  let
                    disabled = "none";
                    ruff = disabled;
                    info = "information";
                    warning = "warning";
                    unreachable = "unreachable";
                    deprecated = "deprecated";
                    unused = "unused";
                  in
                  {
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
            typescript-language-server.config = {
              hostInfo = "helix";
              documentFormatting = false;
              completions.completeFunctionCalls = true;
              typescript.inlayHints = {
                includeInlayEnumMemberValueHints = true;
                includeInlayFunctionLikeReturnTypeHints = true;
                includeInlayFunctionParameterTypeHints = true;
                includeInlayParameterNameHints = "all";
                includeInlayParameterNameHintsWhenArgumentMatchesName = true;
                includeInlayPropertyDeclarationTypeHints = true;
                includeInlayVariableTypeHints = true;
              };
            };
            vscode-eslint-language-server.config = {
              format = true;
              onIgnoredFiles = "off";
              packageManager = "pnpm";
              quiet = false;
              useESLintClass = false;
              codeActionOnSave.mode = "all";
            };
          };
          language = [
            {
              name = "nix";
              auto-format = true;
            }
            {
              name = "python";
              language-servers = [
                "basedpyright"
                "ruff"
              ];
              auto-format = true;
            }
          ]
          ++
            map
              (name: {
                inherit name;
                language-servers = [
                  "typescript-language-server"
                  "vscode-eslint-language-server"
                ];
                auto-format = true;
                formatter = {
                  command = "npx";
                  args = [
                    "prettier"
                    "--parser"
                    "typescript"
                  ];
                };
              })
              [
                "javascript"
                "jsx"
                "typescript"
                "tsx"
              ];
        };
      };
    };
}
