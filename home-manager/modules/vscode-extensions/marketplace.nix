{pkgs, ...}:
map
(extension:
    pkgs.vscode-utils.buildVscodeMarketplaceExtension {
      mktplcRef = {
        inherit (extension) name publisher version sha256;
      };
    })
(import ./marketplace-list.nix)
