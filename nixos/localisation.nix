{pkgs, ...}: {
  time.timeZone = "America/Toronto";
  services.xserver.xkb = {
    layout = "ca";
    variant = "";
  };
  console.keyMap = "cf";

  i18n = {
    defaultLocale = "en_CA.UTF-8";
    inputMethod = {
      enable = true;
      type = "ibus";
      ibus.engines = [
        (
          pkgs.ibus-engines.typing-booster.override
          {langs = ["en-ca" "fr-moderne"];}
        )
      ];
    };
  };

  environment.systemPackages = with pkgs; [
    hunspell
    hunspellDicts.en-ca
    hunspellDicts.fr-moderne
  ];

  fonts.packages = [pkgs.noto-fonts-emoji];
}
