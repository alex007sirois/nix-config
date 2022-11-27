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
    # FIXME: https://github.com/starship/starship/issues/4507
    enable = false;

    # starship init nu | str replace --string "size -c" "size" | save ~/.cache/starship/init.nu
    # "source ~/.cache/starship/init.nu" | save --raw --append ~/.config/nushell/config.nu
    # "let-env config = {show_banner: false}" | save --raw --append ~/.config/nushell/config.nu
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
