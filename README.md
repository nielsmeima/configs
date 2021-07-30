### TODOs
* [ ] Fix how I setup dotfiles using [Stow](https://www.gnu.org/software/stow/)
	* https://www.kabisa.nl/tech/how-to-manage-dotfiles-with-gnu-stow/
	* https://gruby.medium.com/dotfile-how-to-manage-and-sync-with-git-gnu-stow-6beada1529ea
	* [Video](https://www.youtube.com/watch?v=tkUllCAGs3c)

* [ ] Customize bashrc for WSL/Linux
	* [ ] Figure out how to deal with platform differences, e.g. keep WSL stuff separate from Linux stuff
	* [ ] DISPLAY variable (needs to be unset on Linux, needs to be set on WSL to a specific Windows Network Adapter IP)
* [ ] Install FireMono NF on Linux and set as default
* [ ] Write `install` scripts which (IDEA: I want to be able to do `curl -sfL https://get.meima.dev | sh -` to install my entire setup):
	1. Installs `ansible`
	2. Executes the required playbooks (ensure that we can easily install the "minimal viable setup", e.g. only shell, editor, etc. stuff
	3. Execute `stow` for configs
* [ ] Basic dependencies (to be setup with `ansible` + `stow`)
	* [ ] `stow`
	* [ ] `curl`
	* [ ] Common dependencies
		* `gnupg`
		* `gnupg2`
		* `apt-transport-https`
		* `ca-certificates`
		* `gnupg-agent`
		* `bash-completion`
		* `update-alternatives`
	* [ ] `bash`
		* Setup `~/.bashrc`
		* Setup `~/.bash_aliases
			* `exa` instead of `ls` (also with completions)
			* `fd` instead of `find` (also with completions)
			* `rg` instead of `grep` (also with completions)
			* `gdb()` for deleting git branches both local as well as remote
			* `gtr` (git track remotes) for tracking all remote branches
			* `em` and `er` for markdown editing in nvim (with correct browser, which is platform specific)
			* `k` for `kubectl` (also with completions)
	* [ ] `nvim`
		* [ ] Automatically `:PaqInstall`, e.g. through `nvim -c ":PaqInstall"
		* [ ] Automatically runs `:TSInstall` for all our languages (see "Languages and their Language Servers" down below)
		* [ ] Add all languages to the LSP array
		* [ ] Look into snippets (especially for Kubernetes stuff, OR use `kubectl` here?)
		* [ ] Make a `/lua` directory and nicely split things into modules
	* [ ] `alacritty`
		* Configure font-name (differs per OS, i.e. `FireMono NF` on Windows and `FiraMono Nerd Font` on Linux)
	* [ ] `rg` (and completions)
	* [ ] `fd` (and completions)
	* [ ] `exa` (and completions)
	* [ ] `tmux`
	* [ ] `fzf` (and completions)
	* [ ] `docker` (and completions)
	* [ ] `podman` and `buildah` (aliased to docker)
	* [ ] `kubectl` (and completions)
	* [ ] `k3s`
	* [ ] `kubefire`
	* [ ] `krew` 
		* Plugins
	  		* `ctx`
			* `ns`
	* [ ] `helm`
	* [ ] `k3sup`
	* [ ] `telepresence`
	* [ ] `powerline`
	* [ ] `python3`
	* [ ] `guild`
	* [ ] Languages and their Language Servers
		* [ ] `python` and `pyright`
		* [ ] `julia` and `julials`
		* [ ] `go` and `gopls`
		* [ ] `rust` and `rust_analyzer`
		* [ ] `node` and ``
		* [ ] `typescript` and `tsserver`
		* [ ] `lua` and `sumneko_lua`
		* Language Servers not associated with a language
			* `dockerls`
			* `yamlls`
			* `bashls`
	* [ ] `joplin`
	* [ ] `chrome`
	* [ ] `zotero`
	* [ ] `nvm`
	* [ ] `git`
		* Git config file (see `jonhoo` for an example: https://github.com/jonhoo/configs/blob/master/shell/.config/git/config)
	* [ ] `wireguard`
	* [ ] `jq`
	* [ ] `pgcli`
* [ ] Switch to `zsh`?
* [ ] Figure out how to deal with different use names (template dotfiles with correct username? There must be a better way...)
* [ ] Figure out how to deal with private stuff / customizations per installation
	* Use branches for customizations?
	* Use private submodules for private stuff?
	* Customize alacritty.yml with Kustomize for windows and linux (shell section)?
	* e.g. KUBEPATH for kube configs
