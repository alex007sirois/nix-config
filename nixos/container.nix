{pkgs, ...}: let
  docker-enable-qemu =
    pkgs.writeShellScriptBin
    "docker-enable-qemu"
    "${pkgs.docker}/bin/docker run --privileged --rm tonistiigi/binfmt --install all";
in {
  virtualisation.docker.enable = true;
  environment.systemPackages = [docker-enable-qemu];
}
