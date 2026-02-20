{
  flake.modules =
    let
      identityPaths = [ "/home/alex/.ssh/agenix_key" ];
      rekey.hostPubkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKqsh2Ex7bY1HOh4HdBKcWpqvKySDZ8j/gHkJRdwc/hd";
    in
    {
      homeManager.home-desktop.age = { inherit identityPaths rekey; };
      nixos.home-desktop.age = {
        inherit identityPaths rekey;
        secrets = {
          linux-password.rekeyFile = ./linux-password.age;
        };
      };
    };
}
