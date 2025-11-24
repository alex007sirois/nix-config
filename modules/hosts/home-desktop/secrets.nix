{
  flake.modules = let
    identityPaths = ["/home/alex/.ssh/agenix_key"];
    hostPubkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKqsh2Ex7bY1HOh4HdBKcWpqvKySDZ8j/gHkJRdwc/hd";
  in {
    homeManager.home-desktop = {
      age = {
        inherit identityPaths;
        rekey = {
          inherit hostPubkey;
          localStorageDir = ./. + "/secrets/home";
        };
      };
    };
    nixos.home-desktop = {
      age = {
        inherit identityPaths;
        rekey = {
          inherit hostPubkey;
          localStorageDir = ./. + "/secrets/nixos";
        };

        secrets = {
          linux-password.rekeyFile = ./secrets/linux-password.age;
        };
      };
    };
  };
}
