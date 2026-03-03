{ inputs, ... }:
{
  flake-file.inputs.bitdefender-nix = {
    url = "git+ssh://git@bitbucket.org/amotus/bitdefender-nix.git";
    inputs.nixpkgs.follows = "nixpkgs";
  };
  flake.modules.nixos.work =
    { config, ... }:
    {
      imports = [ inputs.bitdefender-nix.nixosModules.default ];

      age.secrets = {
        bitdefender-credentials.rekeyFile = ./bitdefender-credentials.age;
      };

      services.bitdefender-security-container = {
        enable = true;
        credentialsFile = config.age.secrets.bitdefender-credentials.path;
      };
    };
}
