{ pkgs
, ...
}: {
  home.packages = with pkgs;
    [
      delta
      git
      git-lfs
      lazygit
    ];

  programs.git = {
    enable = true;
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
