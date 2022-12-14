{pkgs, ...}: {
  time.timeZone = "America/Toronto";
  services.xserver = {
    layout = "ca";
    xkbVariant = "";
  };
  console.keyMap = "cf";

  i18n = {
    defaultLocale = "en_CA.UTF-8";
    inputMethod = {
      enabled = "ibus";
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

  fonts.fonts = [pkgs.noto-fonts-emoji];
}
