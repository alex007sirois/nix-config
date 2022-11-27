{ pkgs
, ...
}: {
  home.packages = with pkgs;
    [
      delta
      git
      git-lfs
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
      };
    };
    extraConfig = {
      merge.conflictstyle = "diff3";
      diff.colorMoved = "default";
    };
  };
}
