{pkgs, ...}:
with pkgs.vscode-extensions; [
  charliermarsh.ruff
  ms-python.vscode-pylance
  ms-python.python
  ms-python.black-formatter
  njpwerner.autodocstring
]
