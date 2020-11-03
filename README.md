![nixos-home](https://socialify.git.ci/pinpox/nixos-home/image?description=1&descriptionEditable=My%20home-manager%20%24USER%20setup&font=Source%20Code%20Pro&forks=1&issues=1&logo=https%3A%2F%2Fpablo.tools%2Fimg%2Favatar.gif&owner=1&pattern=Circuit%20Board&pulls=1&stargazers=1&theme=Light)

My user setup for [NixOS](nixos.org) Desktops.
System configuration is in a [separate repository](https://github.com/pinpox/nixos).

Visit [pablo.tools](https://pablo.tools/blog) for details.

## Setup

The following steps are assumed to be taken as the user for which the
configuratino should be set up.

### Install home-manager

Install home-manager for unstable channel and removed generated config.

```bash
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install
rm .config/nixpkgs/home.nix
```

### Install configuration

The following downloads this repository as zip instead of cloning it directly.
This is useful because the user probably does not have any known SSH-keys in
`~/.ssh` and yubikey is not yet set up.

```bash
wget https://github.com/pinpox/nixos-home/archive/master.zip

# In case unzip is not present, use this shell:
# nix-shell -p pkgs.unzip

unzip master.zip
mv nixos-home-master/* .config/nixpkgs

# Cleanup
rm -rf nixos-home-master
rm master.zip
```

### Rebuild

Run:

```bash
home-manager switch
```

If everything went well, log out and back in.

# TODO 

- generate ~/.xinitrc
```
exec ~/.hm-xsession
```

