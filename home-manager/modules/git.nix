{pkgs, ...}: {
  home.packages = with pkgs; [
    git-ignore
  ];

  programs.git = {
    enable = true;
    userName = "Alex Sirois";
    aliases = {
      aliases = "config --get-regexp ^alias\.";
      branches = "branch -a --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(contents:subject) %(color:blue)(%(committerdate:short)) [%(authorname)]' --sort=-committerdate";
      logs = "log --pretty=format:'%C(auto)%h%C(reset) %C(cyan)%ad%C(auto)%d%C(reset) %s %C(blue)[%cn]%C(reset)' --date=short-local";
      save = "!git add -A && git commit -m 'chore: savepoint'";
      uncommit = "reset --mixed HEAD~1";
      nuke = "!git reset --hard && git clean -fdx";
    };
    ignores = [
      ".direnv"
      ".envrc"
    ];
    lfs = {
      enable = true;
    };
    difftastic = {
      enable = true;
      background = "dark";
    };
    extraConfig = {
      core = {
        autocrlf = "input";
        ignorecase = false;
      };
      diff = {
        colorMoved = "default";
        renames = "copy";
      };
      fetch = {
        prune = true;
        pruneTags = true;
      };
      log = {
        date = "iso";
      };
      merge = {
        conflictstyle = "zdiff3";
        directoryRenames = true;
      };
      rebase = {
        updateRefs = true;
        autoStash = true;
      };
      pull = {
        rebase = true;
      };
      push = {
        autoSetupRemote = true;
        followTags = true;
      };
    };
  };
  programs.lazygit = {
    enable = true;
    settings = {
      gui = {
        returnImmediately = true;
        nerdFontsVersion = "3";
        timeFormat = "2006-01-02 15:04:05";
      };
      git = {
        branchLogCmd = "git logs --graph";
        paging.externalDiffCommand = "difft --color=always";
        parseEmoji = true;
      };
    };
  };
  home.shellAliases = {
    lg = "lazygit";
  };
}
