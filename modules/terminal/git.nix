{
  flake.modules.homeManager.terminal =
    {
      config,
      pkgs,
      ...
    }:
    {
      home.packages = with pkgs; [
        git-ignore
      ];

      programs = {
        git = {
          enable = true;
          lfs.enable = true;
          ignores = [
            ".direnv"
            ".envrc"
          ];
          settings = {
            user = { inherit (config.user) name email; };
            alias = {
              aliases = "config --get-regexp ^alias\.";
              branches = "branch -a --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(contents:subject) %(color:blue)(%(committerdate:short)) [%(authorname)]'";
              logs = "log --pretty=format:'%C(auto)%h%C(reset) %C(cyan)%ad%C(auto)%d%C(reset) %s %C(blue)[%cn]%C(reset)' --date=short-local --ext-diff";
              save = "!git add -A && git commit -m 'chore: savepoint'";
              uncommit = "reset --mixed HEAD~1";
              nuke = "!git reset --hard && git clean -fdx";
            };
            branch.sort = "-committerdate";
            column.ui = "auto";
            core = {
              autocrlf = "input";
              ignorecase = false;
            };
            diff = {
              algorithm = "histogram";
              colorMoved = "plain";
              colormovedws = "allow-indentation-change";
              mnemonicPrefix = "true";
              renames = "copy";
            };
            fetch = {
              prune = true;
              pruneTags = true;
            };
            help.autocorrect = "prompt";
            init.defaultBranch = "main";
            log = {
              date = "iso";
            };
            merge = {
              conflictstyle = "zdiff3";
              directoryRenames = true;
            };
            pager.difftool = true;
            pull = {
              rebase = true;
            };
            push = {
              autoSetupRemote = true;
              followTags = true;
            };
            rebase = {
              autoSquash = true;
              autoStash = true;
              updateRefs = true;
            };
            rerere = {
              autoupdate = true;
              enabled = true;
            };
            tag.sort = "version:refname";
          };
        };
        difftastic = {
          enable = true;
          git = {
            enable = true;
            diffToolMode = true;
          };
          options.background = "dark";
        };
        lazygit = {
          enable = true;
          settings = {
            gui = {
              returnImmediately = true;
              nerdFontsVersion = "3";
              timeFormat = "2006-01-02 15:04:05";
            };
            git = {
              branchLogCmd = "git logs --graph";
              pagers = [ { externalDiffCommand = "difft --color=always"; } ];
              parseEmoji = true;
            };
          };
        };
      };
      home.shellAliases = {
        lg = "lazygit";
      };
    };
}
