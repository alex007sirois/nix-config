# nix-config

## Botstrap

1. Install nix
2. Append `experimental-features = nix-command flakes` to `/home/alex/.config/nix/nix.conf`
3. Install home-manager: `nix shell 'nixpkgs#home-manager'`
4. Switch home-manager to latest config: `home-manager switch --flake github:alex007sirois/nix-config`
5. Update login shell:

    ```bash
    shell=$(which zsh)
    echo $shell >> /etc/shells
    chsh -c $shell
    ```

7. Garbage-collect nix store: `nix store gc`
8. Optimise nix store: `nix store optimise`
