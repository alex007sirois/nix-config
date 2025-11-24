{
  flake.modules.homeManager.terminal = {pkgs, ...}: {
    home.packages = with pkgs; [
      bat
      choose
      fd
      file
      coreutils-full
      hyperfine
      rnr
      sd
      viddy
    ];

    programs.ripgrep.enable = true;
  };
}
