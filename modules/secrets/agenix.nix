{inputs, ...}: {
  flake-file.inputs = {
    agenix.url = "github:ryantm/agenix";
    agenix-rekey.url = "github:oddlama/agenix-rekey";
  };
  imports = [
    inputs.agenix-rekey.flakeModule
  ];

  flake.modules = let
    age = {
      rekey = {
        masterIdentities = [
          {
            identity = ../../master-key.age;
            pubkey = "age15zmkh57u252v7z22lluc4mpr25m0de9e5up6yzmulj3e30qrr9yse539k9";
          }
        ];
        storageMode = "local";
      };
    };
  in {
    homeManager.secrets = {
      imports = with inputs; [
        agenix.homeManagerModules.default
        agenix-rekey.homeManagerModules.default
      ];
      inherit age;
    };
    nixos.secrets = {
      imports = with inputs; [
        agenix.nixosModules.default
        agenix-rekey.nixosModules.default
      ];
      inherit age;
    };
  };
}
