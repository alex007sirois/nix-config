{pkgs, ...}: {
  home.packages = with pkgs; [
    python3
    pyright
    black
    pipx
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

  home.sessionPath = ["$HOME/.local/bin"];
}
