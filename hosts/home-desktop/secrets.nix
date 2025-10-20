{
  age = {
    identityPaths = ["/home/alex/.ssh/agenix_key"];

    rekey = {
      hostPubkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKqsh2Ex7bY1HOh4HdBKcWpqvKySDZ8j/gHkJRdwc/hd";
      localStorageDir = ./. + "/secrets/rekeyed/";
    };
  };
}
