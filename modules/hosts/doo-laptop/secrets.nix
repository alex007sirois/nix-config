{
  flake.modules = let
    identityPaths = ["/home/alex/.ssh/agenix_key"];
    hostPubkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEu3+HbOUt28vaxUIci+XZ+p67a0HS5crWhmLdlP4BU5";
  in {
    homeManager.doo-laptop = {
      age = {
        inherit identityPaths;
        rekey = {
          inherit hostPubkey;
          localStorageDir = ./. + "/secrets/home";
        };

        secrets = {
          ssh-config.rekeyFile = ./secrets/ssh-config.age;
        };
      };
    };
    nixos.doo-laptop = {
      age = {
        inherit identityPaths;
        rekey = {
          inherit hostPubkey;
          localStorageDir = ./. + "/secrets/nixos";
        };

        secrets = {
          linux-password.rekeyFile = ./secrets/linux-password.age;
          tactical-agent-token.rekeyFile = ./secrets/tactical-agent-token.age;
        };
      };
    };
  };
}
