{inputs, ...}: {
  flake-file.inputs = {
    agenix.url = "github:ryantm/agenix";
    agenix-rekey.url = "github:oddlama/agenix-rekey";
  };
  imports = [
    inputs.agenix-rekey.flakeModule
  ];

  flake.modules = let
    masterIdentities = [
      {
        identity = ../../secrets/master-key.age;
        pubkey = "age15zmkh57u252v7z22lluc4mpr25m0de9e5up6yzmulj3e30qrr9yse539k9";
      }
    ];
    storageMode = "local";
  in {
    homeManager.secrets = {
      imports = with inputs; [
        agenix.homeManagerModules.default
        agenix-rekey.homeManagerModules.default
      ];
      age.rekey = {inherit masterIdentities storageMode;};
    };
    nixos.secrets = {config, ...}: {
      imports = with inputs; [
        agenix.nixosModules.default
        agenix-rekey.nixosModules.default
      ];
      age.rekey = {
        inherit masterIdentities storageMode;
        localStorageDir = ../../secrets/${config.networking.hostName}/nixos;
      };
    };
  };
}
