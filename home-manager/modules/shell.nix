{pkgs, ...}: {
  home.packages = with pkgs; [
    bashInteractive
  ];

  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
    history.expireDuplicatesFirst = true;
    oh-my-zsh = {
      enable = true;
    };
    sessionVariables = {
      USE_POWERLINE = "true";
      ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE = "fg=244";
    };
    initExtra = ''
      bindkey '^H' backward-kill-word
      bindkey '5~' kill-word
    '';
  };

  programs.bash = {
    enable = true;
  };

  programs.nushell = {
    enable = true;
    configFile.text = "let-env config = {show_banner: false}";
  };

  programs.starship = {
    enable = true;

    settings = {
      add_newline = false;
      directory.truncation_length = 8;
      git_branch.truncation_length = 24;
      shell.disabled = false;
      status = {
        disabled = false;
        map_symbol = true;
        pipestatus = true;
      };
      # symbols
      aws.symbol = "  ";
      buf.symbol = " ";
      c.symbol = " ";
      conda.symbol = " ";
      dart.symbol = " ";
      directory.read_only = " ";
      docker_context.symbol = " ";
      elixir.symbol = " ";
      elm.symbol = " ";
      fossil_branch.symbol = " ";
      git_branch.symbol = " ";
      golang.symbol = " ";
      guix_shell.symbol = " ";
      haskell.symbol = " ";
      haxe.symbol = "⌘ ";
      hg_branch.symbol = " ";
      java.symbol = " ";
      julia.symbol = " ";
      lua.symbol = " ";
      memory_usage.symbol = " ";
      meson.symbol = "喝 ";
      nim.symbol = " ";
      nix_shell.symbol = " ";
      nodejs.symbol = " ";
      os.symbols = {
        Alpine = " ";
        Amazon = " ";
        Android = " ";
        Arch = " ";
        CentOS = " ";
        Debian = " ";
        DragonFly = " ";
        Emscripten = " ";
        EndeavourOS = " ";
        Fedora = " ";
        FreeBSD = " ";
        Garuda = "﯑ ";
        Gentoo = " ";
        HardenedBSD = "ﲊ ";
        Illumos = " ";
        Linux = " ";
        Macos = " ";
        Manjaro = " ";
        Mariner = " ";
        MidnightBSD = " ";
        Mint = " ";
        NetBSD = " ";
        NixOS = " ";
        OpenBSD = " ";
        OracleLinux = " ";
        Pop = " ";
        Raspbian = " ";
        RedHatEnterprise = " ";
        Redhat = " ";
        Redox = " ";
        SUSE = " ";
        Solus = "ﴱ ";
        Ubuntu = " ";
        Unknown = " ";
        Windows = " ";
        openSUSE = " ";
      };
      package.symbol = " ";
      pijul_channel.symbol = "🪺 ";
      python.symbol = " ";
      rlang.symbol = "ﳒ ";
      ruby.symbol = " ";
      rust.symbol = " ";
      scala.symbol = " ";
      spack.symbol = "🅢 ";
      status.symbol = "💥";
    };
  };
}
