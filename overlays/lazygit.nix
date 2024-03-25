self: super: {
  lazygit = super.lazygit.overrideAttrs {
    version = "0.41.0";
    src = super.fetchFromGitHub {
      repo = "lazygit";
      owner = "jesseduffield";
      rev = "v0.41.0";
      sha256 = "Ok6QnXw3oDeSzBekft8cDXM/YsADgF1NZznfNoGNvck=";
    };
  };
}
