# Xubuntu + Home manager setup

Minimalistic setup for daily driver.
Easy to install, easy to maintain.

## Installation

1. Install deps
```sh
sudo apt update
sudo apt install -y git
sudo apt install -y curl
```

2. Install nix (see https://nixos.org/download)
```sh
sh <(curl -L https://nixos.org/nix/install) --daemon
```

3. Restart shell

4. Run installation script as target user
```sh
curl -fs https://raw.githubusercontent.com/tyasheliy/xubuntu/refs/heads/master/install.sh | bash
```

5. Set zsh as default shell
```sh
(cd ~/os/scripts && bash set_zsh.sh)
```

6. Reboot system

## Usage

System is controlled with bash scripts in `~/os/scripts` (I name it _scripts dir_).
These scripts should be executing as target user of home-manager and in context of _scripts dir_.
For that purpose `~/os/rn.sh` script was developed. It's very simple script that works in 2 modes.
When there is no arguments script searches _scripts dir_ for every .sh file and display these in fzf interface,
after selecting rn.sh just executes selected script in context of _scripts dir_. Where there is an argument, rn.sh
just assumes that argument is name of script that should be executed.

Home-manager config provides simple alias for rn.sh: `rn`, that just runs rn.sh with proper env.

```sh
rn # select and execute script in fzf interface.
rn autoremove.sh # execute script autoremove.sh in context of ~/os/scripts.
```

Need custom script? Just put it in _scripts dir_ and it'll be available in `rn` menu.
Wanna add custom home-manager module? Add new `~/os/home/{module_name}/default.nix`, add it to git (nix flakes moment)
and run `hsw` alias, done!

See other available shell aliases in `~/os/home/shell/default.nix`.

Most useful scripts in workflow:
* `clear_docker.sh` - deletes all docker containers
* `autoremove.sh` - clears apt and nix packages
* `backup.sh` - backups system in tar archive
* `tmux_*.sh` - tmux related stuff

Optional stuff:
* `install_ly.sh` - replaces default display manager with minimalistic https://github.com/fairyglade/ly
* `remove_splashscreen.sh` - removes Xubuntu default splashscreen on startup and on shutdown
* `install_throttled.sh` - installs and enables throttled service https://github.com/erpalma/throttled

## TODO

* visual studio code home-manager integration (there are home options in docs)
* firefox config in the nix way
* get rid of snaps
