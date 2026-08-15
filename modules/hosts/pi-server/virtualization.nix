{
  flake.modules = {
    nixos.pi-server = {
      virtualisation = {
        oci-containers.backend = "podman";
        podman.autoPrune.enable = true;
      };
    };
  };
}
