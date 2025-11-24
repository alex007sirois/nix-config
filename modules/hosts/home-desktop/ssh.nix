{
  flake.modules.homeManager.home-desktop = {
    programs.git.userEmail = "alex007sirois@gmail.com";

    programs.ssh.matchBlocks = {
      "github.com".identityFile = "~/.ssh/git_key";
    };
  };
}
