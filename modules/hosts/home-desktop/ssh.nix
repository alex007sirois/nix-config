{
  flake.modules.homeManager.home-desktop = {
    programs.ssh.settings = {
      "github.com".IdentityFile = "~/.ssh/git_key";
    };
  };
}
