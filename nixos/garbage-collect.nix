let
  B = 1;
  KB = 1024 * B;
  MB = 1024 * KB;
  GB = 1024 * MB;
in {
  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
    extraOptions = ''
      min-free = ${toString (1 * GB)}
      max-free = ${toString (5 * GB)}
    '';
  };
}
