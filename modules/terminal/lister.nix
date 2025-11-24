{
  flake.modules.homeManager.terminal = {
    programs.eza = {
      enable = true;
      git = true;
      icons = "auto";
      extraOptions = ["--classify" "--group-directories-first" "--time-style=long-iso"];
    };
  };
}
