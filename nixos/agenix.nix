{inputs, ...}: {
  imports = with inputs; [
    agenix.nixosModules.default
    agenix-rekey.nixosModules.default
  ];

  age.rekey = {
    masterIdentities = [
      {
        identity = ../master-key.age;
        pubkey = "age15zmkh57u252v7z22lluc4mpr25m0de9e5up6yzmulj3e30qrr9yse539k9";
      }
    ];
    storageMode = "local";
  };
}
