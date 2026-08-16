{
  flake.modules =
    let
      identityPaths = [ "/home/alex/.ssh/agenix_key" ];
      rekey.hostPubkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKOJL5dI6K0Yb8TIm6y9G1fGe8c6Bs+QynOg0TTwrXRg";
    in
    {
      homeManager.pi-server.age = { inherit identityPaths rekey; };
      nixos.pi-server.age = {
        inherit identityPaths rekey;
        secrets = {
          linux-password.rekeyFile = ./linux-password.age;
        };
      };
    };
}
