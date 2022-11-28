{ pkgs
, ...
}: {
  home.packages = with pkgs;
    [
      bashInteractive
      zsh
      nushell
      starship
    ];

  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    oh-my-zsh = {
      enable = true;
    };
    sessionVariables = {
      USE_POWERLINE = "true";
      ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE = "fg=244";
    };
    initExtra = "
    bindkey '^H' backward-kill-word
    bindkey '5~' kill-word
    ";
  };

  programs.bash = {
    enable = true;
  };

  programs.nushell = {
    # FIXME: https://github.com/alex007sirois/nix-config/issues/2
    enable = false;
  };

  programs.starship = {
    enable = true;

    settings = {
      add_newline = false;
      cmd_duration.min_time = 3000;
      directory.truncation_length = 8;
      git_branch.truncation_length = 24;
      shell.disabled = false;
      status = {
        disabled = false;
        map_symbol = true;
        pipestatus = true;
        symbol = "💥";
      };
    };
  };
}
