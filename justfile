default: diff

update:
	nix flake update

build:
	nixos-rebuild build --flake .

switch:
	sudo nixos-rebuild switch --flake .

test:
	sudo nixos-rebuild test --flake .

diff: build
	nix store diff-closures /nix/var/nix/profiles/system result/

vscode:
	aria2c https://raw.githubusercontent.com/NixOS/nixpkgs/master/pkgs/applications/editors/vscode/extensions/update_installed_exts.sh
	chmod +x update_installed_exts.sh
	./update_installed_exts.sh
	rm ./update_installed_exts.sh
