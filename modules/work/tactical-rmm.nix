{inputs, ...}: {
  flake-file.inputs = {
    tactical-rmm.url = "git+ssh://git@bitbucket.org/amotus/tactical-rmm-nix.git";
  };
  flake.modules.nixos.work = {config, ...}: {
    imports = [inputs.tactical-rmm.nixosModules.default];

    services.tacticalAgent = {
      enable = true;
      apiUrl = "https://tactical-api.amotus.com";
      tokenFile = config.age.secrets.tactical-agent-token.path;
    };
  };
}
