default: build

flake := justfile_directory()
determinate-flags := "--option extra-substituters https://install.determinate.systems --option extra-trusted-public-keys cache.flakehub.com-3:hJuILl5sVK4iKm86JzgdXW12Y2Hwd5G07qKtHTOcDCM="

update *inputs:
	nix flake update {{inputs}}

update-all:
	nix flake update

build:
	nh os build {{flake}} -- {{determinate-flags}}

test:
	nh os test {{flake}} -- {{determinate-flags}}

switch:
	nh os boot --ask {{flake}} -- {{determinate-flags}}

generate-master-key:
	rage-keygen | rage -p -o master-key.age
	@echo "Add public key to nixos/agenix.nix"
	git add -N master-key.age

edit-secret:
	agenix edit
	git add -N **/*.age
	agenix rekey -a

prepare-deploy-ssh target:
	ssh-copy-id {{target}}

prepare-deploy-kexec target: (prepare-deploy-ssh target)
	ssh {{target}} "(curl -L https://github.com/nix-community/nixos-images/releases/download/nixos-unstable/nixos-kexec-installer-noninteractive-x86_64-linux.tar.gz | tar -xzf- -C /root) && /root/kexec/run"

deploy target hostname: (prepare-deploy-ssh target)
	nix run github:nix-community/nixos-anywhere -- --flake '.#{{hostname}}' {{target}}
