{
  flake.modules.homeManager.terminal = {
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
    };
  };
}
