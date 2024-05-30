{pkgs, ...}:
with pkgs.vscode-extensions; [
  aaron-bond.better-comments
  streetsidesoftware.code-spell-checker
  github.copilot
  github.copilot-chat
  wmaurer.change-case
]
