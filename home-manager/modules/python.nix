{pkgs, ...}: {
  home.packages = with pkgs; [
    python3
    pyright
    black
  ];

  programs.helix.languages = [
    {
      name = "python";
      roots = ["pyproject.toml"];
      language-server = {
        command = "pyright-langserver";
        args = ["--stdio"];
      };
      config = {};
      formatter = {
        command = "black";
        args = ["--quiet" "-"];
      };
    }
  ];
}
