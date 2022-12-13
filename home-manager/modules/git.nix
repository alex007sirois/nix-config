{pkgs, ...}: {
  home.packages = with pkgs; [
    git-ignore
    git-quick-stats
    git-standup
  ];

  programs.git = {
    enable = true;
    aliases = {
      aliases = "config --get-regexp ^alias\.";
      branches = "branch -a  --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(contents:subject) %(color:blue)(%(committerdate:short)) [%(authorname)]' --sort=-committerdate";
      logs = "log --pretty=format:'%C(auto)%h%C(reset) %C(cyan)%ad%C(auto)%d%C(reset) %s %C(blue)[%cn]%C(reset)' --date=short-local";
      save = "!git add -A && git commit -m 'chore: savepoint'";
      uncommit = "reset --mixed HEAD~1";
      wipe = "!git reset --hard && git clean -fdx";
    };
    lfs = {
      enable = true;
    };
    delta = {
      enable = true;
      options = {
        light = false;
        navigate = false;
        line-numbers = true;
        side-by-side = true;
        hyperlinks = true;
      };
    };
    extraConfig = {
      merge.conflictstyle = "diff3";
      diff.colorMoved = "default";
      core = {
        ignorecase = false;
        autocrlf = "input";
      };
      fetch = {
        prune = true;
        pruneTags = true;
      };
      log.date = "iso";
      pull.rebase = true;
      push.autoSetupRemote = true;
    };
  };
  programs.lazygit.enable = true;
}
