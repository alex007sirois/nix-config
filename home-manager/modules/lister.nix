{...}: {
  programs.eza = {
    enable = true;
    git = true;
    icons = true;
    extraOptions = ["--classify" "--group-directories-first" "--time-style=long-iso"];
  };
}
