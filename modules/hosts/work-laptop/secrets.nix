{
  flake.modules =
    let
      identityPaths = [ "/home/alex/.ssh/agenix_key" ];
      rekey.hostPubkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBjR7cN6r6AGQvyliMwxmH11IoS2EkHTyp+8CCrlVrq2";
    in
    {
      homeManager.work-laptop.age = { inherit identityPaths rekey; };
      nixos.work-laptop.age = {
        inherit identityPaths rekey;

        secrets = {
          linux-password.rekeyFile = ./linux-password.age;
        };
      };
    };
}
