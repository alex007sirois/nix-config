{
  age = {
    identityPaths = ["/home/alex/.ssh/agenix_key"];

    rekey = {
      hostPubkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEu3+HbOUt28vaxUIci+XZ+p67a0HS5crWhmLdlP4BU5";
      localStorageDir = ./. + "/secrets/rekeyed/";
    };

  };
}
