{pkgs, ...}:
with pkgs.vscode-extensions; [
  streetsidesoftware.code-spell-checker
  github.copilot
  github.copilot-chat
  wmaurer.change-case
]
