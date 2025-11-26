{
  flake.modules.homeManager.home-desktop = {
    programs.ssh.matchBlocks = {
      "github.com".identityFile = "~/.ssh/git_key";
    };
  };
}
