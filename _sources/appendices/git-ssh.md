(git-ssh-setup)=
# Git, GitHub and SSH Setup

Use this page to install and identify Git, set up access to GitHub, and connect a project to a [remote](terms.md#repository-and-remote): a named local connection to another repository. The [Git chapter](../notebooks/git.ipynb) teaches repositories, commits, branches and collaboration; return there after this one-time setup.

Git records the author name and email in every commit; collaborators can read them in the history. SSH private keys and HTTPS tokens control access to remote repositories and must never be shared or committed.

## Install and check Git

Open a terminal and check whether Git is already available:

```bash
git --version
```

Use a supported package or installer for your platform if it is missing:

| Platform | Usual route |
| --- | --- |
| Ubuntu/Linux | Use your distribution package manager; Ubuntu guidance is in {ref}`ubuntu-packages`. |
| macOS | Install the Xcode Command Line Tools, the official Git installer, or the Git formula from {ref}`macos-tools`. |
| Managed machine | Use the provided Git client or ask IT before installing software. |

Do not use `sudo` or an administrator account merely to configure Git for yourself. VS Code's source-control interface uses the same Git installation; see {ref}`vscode-setup` for the editor workflow.

## Choose the identity recorded in commits

Before making a commit, decide which name and email the repository should show. For public repositories, do not accidentally expose a private address. A GitHub account can provide a no-reply address; use the address appropriate to the course, project and account.

Inspect existing values and where they came from:

```bash
git config --list --show-origin
git config --get user.name
git config --get user.email
```

For one personal identity on this computer, set global values using your own details:

```bash
git config --global user.name "Your Name"
git config --global user.email "you@example.ac.uk"
```

`--global` saves this identity for every repository owned by this operating-system account. If a particular project needs a different approved identity, run the same commands **without** `--global` from that project’s root folder. Check the result before committing; changing configuration later does not rewrite existing commit metadata.

Git may open an editor for merge or commit messages. If the `code` command is available and you want VS Code to wait until a message is saved, you can opt in:

```bash
git config --global core.editor "code --wait"
```

This is optional. Do not copy global line-ending, default-branch or credential settings from an old guide: follow the requirements of the repository you are working in.

## Connect to GitHub with SSH

SSH is the usual MQB route for regular GitHub work. It uses [SSH keys](terms.md#ssh-keys): a private key that remains on your computer and a public key that you add to your GitHub account.

### Check existing keys first

List the SSH directory before creating anything:

```bash
ls -al ~/.ssh
```

Common key pairs are named `id_ed25519` and `id_ed25519.pub`. Here, `ed25519` is the cryptographic key type, not a username or placeholder to replace. The file **without** `.pub` is private; the matching file ending in `.pub` is public. Do not copy the private file into a chat, email, repository or GitHub account. Do not overwrite an existing key merely because its filename appears in a tutorial.

If you need a new software key, generate an Ed25519 key with an account email as a label:

```bash
ssh-keygen -t ed25519 -C "you@example.ac.uk"
```

Choose a passphrase when prompted. If `ssh-keygen` warns that the suggested filename already exists, stop and choose a new descriptive filename instead of replacing a key whose use you do not understand. A passphrase protects the private key if the file is copied; it is not a GitHub password.

**Tip:** A passphrase is optional. Press Enter at both passphrase prompts to leave the key unencrypted; anyone who obtains that private-key file can then use it without a passphrase. With a passphrase, an SSH agent or system keyring can remember it for a session so you do not have to type it for every push or pull.

On Linux or macOS, an SSH agent is a helper program that can remember a key’s passphrase for the current session. Start it, then add the private key you chose:

```bash
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
```

If you chose a different key filename, use that in the `ssh-add` command. Managed devices, hardware keys and agents that start automatically can need different configuration; follow [GitHub's current SSH instructions](https://docs.github.com/en/authentication/connecting-to-github-with-ssh) rather than copying another operating system's startup-file changes.

### Add only the public key to GitHub

Print the public key and copy that single line:

```bash
cat ~/.ssh/id_ed25519.pub
```

In GitHub, open **Settings → SSH and GPG keys → New SSH key**, give it a recognisable title, and paste the public key. Never upload the private-key file or its passphrase. GitHub's [adding an SSH key](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account) guide covers the account step.

A server’s host-key fingerprint is a short identifier for its SSH key. It is not biometric information such as a fingerprint used by Touch ID. Before accepting a new server host key, compare its fingerprint with [GitHub’s published SSH fingerprints](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/githubs-ssh-key-fingerprints). Do not disable host-key checking or accept a changed fingerprint blindly. Once the public key is added, test your account connection:

```bash
ssh -T git@github.com
```

This contacts GitHub but does not create, modify or push a repository. A successful GitHub authentication message does not give shell access to GitHub.

## HTTPS when SSH is unavailable

HTTPS is useful on networks that block SSH or on managed machines where SSH setup is not permitted. GitHub no longer accepts an account password for command-line Git over HTTPS. Use a browser sign-in flow or a credential manager, which stores a sign-in secret in your operating system’s approved credential store. If GitHub requests a password for HTTPS Git, a suitable personal access token is used in that password field.

Keep tokens in the operating system's approved credential store, not in source files, shell history, a remote URL, or a plain-text `git-credentials` file. Use the smallest suitable scope and revoke a token you no longer need. See [GitHub's HTTPS authentication guidance](https://docs.github.com/get-started/git-basics/why-is-git-always-asking-for-my-password).

If a network specifically blocks SSH port 22, ask course or organisational IT whether HTTPS is the supported route. GitHub also documents [SSH over port 443](https://docs.github.com/en/authentication/troubleshooting-ssh/using-ssh-over-the-https-port), but do not add a global SSH configuration workaround unless you understand and need it.

## Add and inspect a remote

If this directory is not already a Git repository, create one from its root first:

```bash
git init
```

Then create the repository on GitHub, work from the root of the local [repository](terms.md#repository-and-remote), and use the exact URL shown by GitHub with one protocol:

```bash
# SSH
git remote add origin git@github.com:YOUR-ACCOUNT/YOUR-REPOSITORY.git

# Or HTTPS
git remote add origin https://github.com/YOUR-ACCOUNT/YOUR-REPOSITORY.git

git remote -v
```

`origin` is a conventional label for a remote, not a special server. `git remote -v` reveals remote URLs, so check it before sharing terminal output if a URL contains unexpected information. Do not paste a token into a remote URL.

If you already have commits locally, create the new GitHub repository without initializing it with a README, licence, or `.gitignore`. Those files would create a separate initial commit and the first push would be rejected until the histories are reconciled. If the remote is already non-empty, clone it first or follow a deliberate history-reconciliation workflow.

Make the first network operation intentional. For a new repository whose branch is named `main`, it may be:

```bash
git push -u origin main
```

Use the actual current branch name shown by `git branch --show-current`; do not assume every repository uses `main`. Here, `-u` remembers `origin main` as the default destination for later pushes from this branch. A push can make commits visible to collaborators, so inspect `git status`, `git log --oneline`, and the remote name before running it.

## Check your setup without changing it

These checks do not contact GitHub or alter Git configuration:

```bash
git config --list --show-origin
git remote -v
ssh -G git@github.com
```

If Git cannot find your identity, set or correct the appropriate global or repository-local `user.name` and `user.email`. If `ssh -T git@github.com` fails, read the exact error before regenerating keys or changing settings. Typical causes are a missing public key in GitHub, an agent without the intended private key, a changed host key, or a restricted network. Course staff or IT can help with managed-device and network policy; never send them a private key, passphrase or token.

(git-ssh-setup-resources)=
## Further reading

- [Git first-time setup](https://git-scm.com/book/en/v2/Getting-Started-First-Time-Git-Setup).
- [GitHub SSH setup](https://docs.github.com/en/authentication/connecting-to-github-with-ssh) and [host-key fingerprints](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/githubs-ssh-key-fingerprints).
- [HTTPS authentication](https://docs.github.com/get-started/git-basics/why-is-git-always-asking-for-my-password) and [SSH over port 443](https://docs.github.com/en/authentication/troubleshooting-ssh/using-ssh-over-the-https-port).

See {ref}`setup-attribution` for the adapted material's attribution, licence and limits of the setup checks.
