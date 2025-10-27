{
  config,
  inputs,
  ...
}: {
  imports = [inputs.tactical-rmm.nixosModules.default];

  services.tacticalAgent = {
    enable = true;
    apiUrl = "https://tactical-api.amotus.com";
    tokenFile = config.age.secrets.tactical-agent-token.path;
  };
}
