{config, ...}: {
  flake.modules = {
    homeManager.default.imports = with config.flake.modules.homeManager; [
      base
      desktop
      nix
      secrets
      style
      terminal
      users
      virtualisation
    ];
    nixos.default.imports = with config.flake.modules.nixos; [
      desktop
      home
      locale
      network
      nix
      secrets
      style
      system
      terminal
      users
      virtualisation
    ];
  };
}
