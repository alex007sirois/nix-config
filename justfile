default: build

flake := justfile_directory()

update *inputs:
	nix flake update {{inputs}}

update-all:
	nix flake update

build:
	nh os build {{flake}}

test:
	nh os test {{flake}}

switch:
	nh os boot --ask {{flake}}

prepare-deploy-ssh target:
	ssh-copy-id {{target}}

prepare-deploy-kexec target: (prepare-deploy-ssh target)
	ssh {{target}} "(curl -L https://github.com/nix-community/nixos-images/releases/download/nixos-unstable/nixos-kexec-installer-noninteractive-x86_64-linux.tar.gz | tar -xzf- -C /root) && /root/kexec/run"

deploy target hostname: (prepare-deploy-ssh target)
	nix run github:nix-community/nixos-anywhere -- --flake '.#{{hostname}}' {{target}}

vscode:
	aria2c https://raw.githubusercontent.com/NixOS/nixpkgs/master/pkgs/applications/editors/vscode/extensions/update_installed_exts.sh
	chmod +x update_installed_exts.sh
	./update_installed_exts.sh
	rm ./update_installed_exts.sh
