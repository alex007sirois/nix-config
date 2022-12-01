# nix-config

## Botstrap

1. [Install nix](https://nixos.org/download.html)
2. Append experimental feature to nix config: `echo 'experimental-features = nix-command flakes' >> /home/alex/.config/nix/nix.conf`
3. Install home-manager: `nix shell 'nixpkgs#home-manager'`
4. Switch home-manager to latest config: `home-manager switch --flake github:alex007sirois/nix-config`
5. Update login shell:

    ```bash
    shell=$(which zsh)
    sudo bash -c "echo $shell >> /etc/shells"
    chsh -s $shell
    ```

7. Garbage-collect nix store: `nix store gc`
8. Optimise nix store: `nix store optimise`
