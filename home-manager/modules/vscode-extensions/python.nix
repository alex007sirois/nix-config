{pkgs, ...}:
with pkgs.vscode-extensions; [
  ms-python.vscode-pylance
  ms-python.python
  njpwerner.autodocstring
]
