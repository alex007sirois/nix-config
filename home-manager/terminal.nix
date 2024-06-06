{
  programs = {
    alacritty = {
      enable = true;
      settings = {
        window = {
          startup_mode = "Maximized";
          opacity = 0.93;
        };
        cursor = {
          style = {
            shape = "Beam";
            blinking = "On";
          };
          vi_mode_style = {
            shape = "Block";
            blinking = "Off";
          };
          blink_timeout = 10;
          blink_interval = 500;
        };
        font.normal.family = "mononoki Nerd Font Mono";
        shell = {
          program = "zellij";
          args = ["--layout" "welcome"];
        };
      };
    };
    zellij = {
      enable = true;
      enableZshIntegration = true;
      settings = {
        default_shell = "zsh";
        session_serialization = true;
      };
    };
  };
  xdg.configFile."zellij/layouts" = {
    source = ./zellij-layouts;
    recursive = true;
  };
  home.shellAliases = {
    zr = "zellij run -- direnv-run";
    zrf = "zellij run --floating -- direnv-run";
    zri = "zellij run --in-place -- direnv-run";
    ze = "zellij edit";
    zef = "zellij edit --floating";
    zei = "zellij edit --in-place";
  };
}
