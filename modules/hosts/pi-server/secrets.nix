{
  flake.modules =
    let
      identityPaths = [ "/home/alex/.ssh/agenix_key" ];
      rekey.hostPubkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIKc64+/4hdbzwkDO3Eyj2j7nnLyWV9j+JT3N0VK8HQB";
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
