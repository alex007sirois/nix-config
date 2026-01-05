{
  flake.modules.nixos.system = {pkgs, ...}: {
    security.rtkit.enable = true;
    services.pulseaudio.enable = false;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;

      wireplumber.package = pkgs.wireplumber.overrideAttrs (prev: {
        version = "0.5.12";
        src = prev.src.override {
          rev = "0.5.12";
          hash = "sha256-3LdERBiPXal+OF7tgguJcVXrqycBSmD3psFzn4z5krY=";
        };
      });
    };
  };
}
