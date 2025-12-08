{inputs, ...}: {
  flake-file.inputs.tactical-rmm = {
    url = "git+https://bitbucket.org/amotus/tactical-rmm-nix.git";
    inputs.nixpkgs.follows = "nixpkgs";
  };
  flake.modules.nixos.work = {config, ...}: {
    imports = [inputs.tactical-rmm.nixosModules.default];

    age.secrets = {
      tactical-agent-token.rekeyFile = ./tactical-agent-token.age;
    };

    services.tacticalAgent = {
      enable = true;
      apiUrl = "https://tactical-api.amotus.com";
      tokenFile = config.age.secrets.tactical-agent-token.path;
    };
  };
}
