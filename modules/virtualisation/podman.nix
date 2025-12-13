{
  flake.modules = {
    nixos.virtualisation = {
      virtualisation = {
        oci-containers.backend = "podman";
        podman.autoPrune.enable = true;
      };
    };
  };
}
