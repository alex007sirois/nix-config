default: write-flake build

flake := justfile_directory()

write-flake:
	nix run ".#write-flake"

update *inputs:
	nix flake update {{inputs}}

update-all:
	nix flake update

[arg('deploy', long, help='SSH target for a remote build')]
[arg('hostname', long, help='NixOS configuration name; defaults to deploy target')]
build deploy='' hostname=deploy:
	nh os build \
		{{if deploy != '' { f"--hostname {{hostname}} --target-host {{deploy}}" } else { '' } }} \
		{{flake}}

[arg('deploy', long, help='SSH target for a remote test')]
[arg('hostname', long, help='NixOS configuration name; defaults to deploy target')]
test deploy='' hostname=deploy:
	nh os test \
		{{if deploy != '' { f"--hostname {{hostname}} --target-host {{deploy}}" } else { '' } }} \
		{{flake}}

[arg('deploy', long, help='SSH target for a remote switch')]
[arg('hostname', long, help='NixOS configuration name; defaults to deploy target')]
switch deploy='' hostname=deploy:
	nh os boot \
		--ask \
		{{if deploy != '' { f"--hostname {{hostname}} --target-host {{deploy}}" } else { '' } }} \
		{{flake}}

clean:
	nh clean all

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

prepare-deploy-kexec target:
	ssh {{target}} "(curl -L https://github.com/nix-community/nixos-images/releases/download/nixos-unstable/nixos-kexec-installer-noninteractive-x86_64-linux.tar.gz | tar -xzf- -C /root) && /root/kexec/run"

# Install a host, optionally prompting for the disk-encryption passphrase.
[confirm('This may erase all configured target disks. Continue?')]
[arg('target', help='SSH destination, such as nixos@192.0.2.1')]
[arg('hostname', help='NixOS configuration name in this flake')]
[arg('extra-files', long, help='Directory to copy into the installed system')]
[arg('disk-encrypt-key', long, help='Prompt for the LUKS passphrase without echoing it')]
[arg('key-path', long, help='Installer path matching Disko passwordFile')]
deploy target hostname extra-files='' disk-encrypt-key='' key-path='/run/luks-passphrase':
	nixos-anywhere \
		--flake {{flake}}#{{hostname}} \
		--target-host {{target}} \
		{{if extra-files != ''  { f"--extra-files {{extra-files}}" } else { '' } }} \
		{{if disk-encrypt-key != '' { f"--disk-encryption-keys {{key-path}} {{disk-encrypt-key}}"} else { '' }}}

save-password path:
	systemd-ask-password > {{path}}

# Enroll unattended TPM unlock on this machine; preserves the recovery passphrase.
[arg('device', help='LUKS partition to enroll, not its decrypted mapper device')]
enroll-tpm device='/dev/disk/by-partlabel/system':
	sudo systemd-cryptenroll \
		--tpm2-device=auto \
		--tpm2-pcrs=4+7+9+12 \
		--tpm2-with-pin=no \
		--wipe-slot=tpm2 \
		'{{device}}'

build-pi-installer:
	nom build .#pi4-installer
