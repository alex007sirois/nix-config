{
  flake.modules = {
    homeManager.terminal = {
      programs.zsh = {
        enable = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;
        history.size = 0;
        oh-my-zsh = {
          enable = true;
          extraConfig = ''
            zstyle ':omz:*' aliases no
          '';
        };
        sessionVariables = {
          ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE = "fg=244";
        };
        initContent = ''
          bindkey '^H' backward-kill-word
          bindkey '5~' kill-word
        '';
      };

      programs.bash = {
        enable = true;
      };

      programs.nushell = {
        enable = true;
      };

      programs.atuin = {
        enable = true;
        settings = {
          update_check = false;
          enter_accept = true;
          filter_mode_shell_up_key_binding = "directory";
        };
      };

      programs.starship = {
        enable = true;

        settings = {
          add_newline = false;
          directory.truncation_length = 8;
          git_branch.truncation_length = 24;
          nix_shell = {
            format = "via [$symbol$state]($style) ";
            impure_msg = "";
            symbol = "";
          };
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
          directory.read_only = " 󰌾";
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
          memory_usage.symbol = "󰍛 ";
          meson.symbol = "󰔷 ";
          nim.symbol = "󰆥 ";
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
            Garuda = "󰛓 ";
            Gentoo = " ";
            HardenedBSD = "󰞌 ";
            Illumos = "󰈸 ";
            Linux = " ";
            Macos = " ";
            Manjaro = " ";
            Mariner = " ";
            MidnightBSD = " ";
            Mint = " ";
            NetBSD = " ";
            NixOS = " ";
            OpenBSD = "󰈺 ";
            OracleLinux = "󰌷 ";
            Pop = " ";
            Raspbian = " ";
            RedHatEnterprise = " ";
            Redhat = " ";
            Redox = "󰀘 ";
            SUSE = " ";
            Solus = "󰠳 ";
            Ubuntu = " ";
            Unknown = " ";
            Windows = "󰍲 ";
            openSUSE = " ";
          };
          package.symbol = "󰏗 ";
          pijul_channel.symbol = "🪺 ";
          python.symbol = " ";
          rlang.symbol = "󰟔 ";
          ruby.symbol = " ";
          rust.symbol = " ";
          scala.symbol = " ";
          spack.symbol = " ";
          status.symbol = "💥";
        };
      };
    };
    nixos.terminal = { config, pkgs, ... }: {
      programs.zsh.enable = true;
      users.users.${config.user.username}.shell = pkgs.zsh;
    };
  };
}
