(macos-tools)=
# macOS Tools and Homebrew

macOS already provides a UNIX-like terminal environment. You do not need to install Linux or Homebrew merely to start the [Unix chapter](../notebooks/unix.ipynb). Homebrew is an optional [package manager](terms.md#package-manager-and-package): a tool that installs, updates and removes software. Official native installers are also appropriate, especially on managed machines.

(macos-check-system)=
## Check your system first

Open Terminal through Spotlight (`Cmd + Space`, then search for Terminal). Inspect the operating system and the architecture of the current process:

```bash
sw_vers
uname -m
command -v bash
command -v brew
```

Apple Silicon normally reports `arm64`; Intel reports `x86_64`. A terminal running under Rosetta can report `x86_64` on Apple Silicon, so also check Apple menu > About This Mac. Prefer native Apple Silicon tools; do not install Rosetta or a second Intel Homebrew just to follow these lessons.

Check Homebrew's current [installation requirements](https://docs.brew.sh/Installation) and [support tiers](https://docs.brew.sh/Support-Tiers) for your macOS version and processor before installing. Support changes over time; an old course note or a successful install does not guarantee that your configuration is supported.

For a machine outside the supported configurations, prefer a compatible official application installer, a supported remote environment, or advice from your institution's IT service. Do not disable OS security controls to force a package to install.

(macos-homebrew-install)=
## Install Homebrew only if needed

1. In Terminal, run `command -v brew`. This asks the shell where it would find the `brew` command. If it prints a location, Homebrew is already available in this terminal. Inspect `brew --prefix` and `brew config` before adding anything else.
2. Follow the current installer instructions on [brew.sh](https://brew.sh/), checking the source and reading the proposed changes before accepting them. The installer can request administrator authorisation for initial provisioning. Enter passwords only into your own trusted installer prompt, never into shared notes or chats.
3. Install Apple's Command Line Tools if Homebrew says they are required for your configuration. The official route is `xcode-select --install`; full Xcode is not automatically required for coursework. Do not repeatedly reinstall developer tools to diagnose an unrelated PATH problem.
4. Follow the installer’s **Next steps** for your actual shell and installation folder. Do not copy a hardcoded path from an Intel-only guide.

Homebrew calls its installation folder a **prefix**. The usual prefixes are `/opt/homebrew` on Apple Silicon and `/usr/local` on Intel. These are folders, not interchangeable commands to run. Native application installers and Homebrew should not manage competing copies of the same application without a deliberate reason.

(macos-shellenv)=
## Make brew available to your shell

Your terminal finds commands by searching the folders listed in [`PATH`](terms.md#path). Homebrew’s installer ends with a **Next steps** section containing commands that add Homebrew’s folder to that list. Copy the commands shown by **your own** installer: they contain the right location for your Mac and tell future terminal sessions to use it too.

On many Apple Silicon Macs, the command for the terminal you are using now is:

```bash
eval "$(/opt/homebrew/bin/brew shellenv)"
```

In this example, `/opt/homebrew/bin/brew` is the program’s full location, beginning at the top of the file system (`/`). This is an [absolute path](terms.md#paths-and-the-current-directory). `brew shellenv` prints the settings that Homebrew needs; `eval` applies those settings to the current terminal. You do not need to type `shellenv` or `eval` separately. Only run the installer-provided command from a Homebrew installation you trust.

Your installer may show a different location. Use its version, not the example above. It will also show a command that records the setting in the relevant [startup file](terms.md#startup-file) so new terminal windows can find `brew`. Recent macOS Terminal sessions normally use zsh, whose login setup commonly belongs in `~/.zprofile`. Bash login shells read the first available of `~/.bash_profile`, `~/.bash_login` and `~/.profile`; interactive non-login Bash reads `~/.bashrc`. Do not paste the same line into all of these files. Preserve existing content and follow the installer for your session type.

Open a new terminal and check:

```bash
command -v brew
brew --prefix
brew config
```

`command -v brew` should print a location such as `/opt/homebrew/bin/brew`. `brew --prefix` should print Homebrew’s installation folder. If `brew` is missing, check the selected startup file and the location shown by your installer before reinstalling. To undo your shell change, remove only the line you added (or restore its backup), then open a fresh terminal. Uninstalling Homebrew itself is a separate operation described in its [FAQ](https://docs.brew.sh/FAQ#how-do-i-uninstall-homebrew).

(macos-packages)=
## Formulae, casks and maintenance

A **formula** is a package that usually supplies command-line software or libraries. A **cask** is a package that commonly installs a graphical application. Inspect first, then install only what you need. These are examples, not prerequisites to run together:

```bash
brew info wget
brew install wget
brew info --cask visual-studio-code
brew install --cask visual-studio-code
```

The current syntax is `brew install --cask`, not `brew cask install`. Do not run `sudo brew ...`. Some casks use their own privileged installers; review any request for authorisation and check managed-machine policy.

```bash
brew update
brew outdated
brew upgrade wget
brew list
brew doctor
```

`brew update` refreshes Homebrew and package information; it does not itself upgrade every installed formula. `brew upgrade wget` upgrades that named package and may affect dependencies. Read diagnostics from `brew doctor`; do not blindly apply every suggested change during a project. Remove an unneeded formula with `brew uninstall wget`, or a cask with `brew uninstall --cask visual-studio-code`, only after checking that you no longer need it. For projects, record tool versions before upgrading.

(macos-command-resolution)=
## Check which command you are running

```bash
command -v git
type -a git
```

`PATH` order can select a Homebrew executable instead of an Apple-provided one. Do not delete or replace programs under system directories. macOS/BSD utilities and GNU utilities can accept different options; read the local manual and test scripts on their target platform. Installing Homebrew does not automatically make every command identical to Linux.

(macos-resources)=
## Further reading

- [Homebrew installation documentation](https://docs.brew.sh/Installation).
- [Homebrew manual](https://docs.brew.sh/Manpage) and [FAQ](https://docs.brew.sh/FAQ).

See {ref}`setup-attribution` for the adapted material's attribution, licence and limits of the setup checks.
