{ ... }: {
  time.timeZone = "America/Toronto";
  i18n.defaultLocale = "en_CA.UTF-8";
  services.xserver = {
    layout = "ca";
    xkbVariant = "";
  };
  console.keyMap = "cf";
}
