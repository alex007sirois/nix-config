self: super: {
  lazygit = super.lazygit.overrideAttrs {
    src = super.fetchFromGitHub {
      repo = "lazygit";
      owner = "jesseduffield";
      rev = "cb1b13e95e09232cced846d167dae6cb21ba696e";
      sha256 = "o8+baCcHBRZT3Xb2aAt+uRnKoDcZImNEsRh7QCBlm0w=";
    };
  };
}
