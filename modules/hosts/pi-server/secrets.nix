{
  flake.modules =
    let
      identityPaths = [ "/etc/agenix/agenix_key" ];
      rekey.hostPubkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIKc64+/4hdbzwkDO3Eyj2j7nnLyWV9j+JT3N0VK8HQB";
    in
    {
      homeManager.pi-server.age = { inherit identityPaths rekey; };
      nixos.pi-server.age = {
        inherit identityPaths rekey;
        secrets = {
          linux-password.rekeyFile = ./linux-password.age;
          wifi-foodie-psk = {
            rekeyFile = ./wifi-foodie-psk.age;
            path = "/var/lib/iwd/Foodie.psk";
            mode = "0600";
            symlink = false;
          };
        };
      };
    };
}
