# Tooling and Environments

Use these pages when you need help getting set up, running notebooks, or working with core tools.

## Supported environments

The computing examples use **macOS or Linux**, with Ubuntu examples where Linux installation commands are needed. Use the software already provided on a managed course machine; ask teaching staff or IT before changing it.

On a Windows computer, use the short {ref}`Ubuntu through WSL route <ubuntu-wsl>`, then follow the Linux instructions throughout. Native Windows Python, R and shell setup is not covered here. Keep the project, interpreter and editor connection in the same environment.

## Start here

If a setup page uses a word you do not know, look it up in [Key computing terms](terms.md) and then return to the step you were following.

- Choosing a Linux environment or configuring Ubuntu: [Linux Setup and Ubuntu Administration](ubuntu-admin.md)
- Setting up macOS command-line tools: [macOS Tools and Homebrew](macos-tools.md)
- Installing Python and managing project packages: [Python Installation and Environments](python-environments.md)
- Installing R and using a personal package library: [R Installation and User Libraries](r-setup.md)
- Working with Python, R and notebooks in an editor: [VS Code for MQB](vscode.md)
- Setting up and testing GitHub Copilot: [Getting started with GitHub Copilot in VS Code](vscode-copilot.md)
- Setting up GitHub access and project remotes: [Git, GitHub and SSH Setup](git-ssh.md)
- If you’re new to notebooks/Jupyter: [Jupyter / notebooks intro](../notebooks/appendix-jupy-intro)

## Common tasks

- Working with databases: [Databases](../notebooks/appendix-databases)

(setup-attribution)=
## Setup Guide Attribution

The platform setup appendices adapt selected material from the Imperial FoNS computing installation guide. Its [source repository at revision `1be8fde4644644ddbae5766028167fd33dc38854`](https://github.com/Imperial-FoNS-Computing/FoNS-installation-instructions/tree/1be8fde4644644ddbae5766028167fd33dc38854) records the source used for the adaptations begun on 30 September 2026.

| MQB page | Adapted source sections |
| --- | --- |
| [Linux Setup and Ubuntu Administration](ubuntu-admin.md) | Linux environments and terminal configuration, combined with MQB's Ubuntu administration material. |
| [macOS Tools and Homebrew](macos-tools.md) | Homebrew and terminal configuration. |
| [Python Installation and Environments](python-environments.md) | Python installation, virtual environments and Jupyter installation. |
| [VS Code for MQB](vscode.md) | VS Code setup. |
| [Git, GitHub and SSH Setup](git-ssh.md) | Git setup. |

These links record attribution, not additional setup steps. The MQB pages are self-contained and link to current official documentation for installation and troubleshooting. They do not rely on the old guide or its institutional software-licensing arrangements. No FoNS screenshots have been copied; separately credited MQB figures retain their own licences.

### Scope of the setup checks

The September and October 2026 reviews included local Linux checks of user-level Bash configuration, Python environments, base-R scripts and local Git configuration. They did not test macOS or WSL installation, graphical editor workflows, system installation or partitioning, or GitHub authentication and pushes. The VS Code R viewer guidance was checked against the extension documentation, not verified in the graphical interface. A successful command-line check is not evidence that every editor or platform is configured correctly.

Use the small checks on each setup page to confirm your own environment. When reporting a problem, include the exact error, operating system, tool versions and the command or editor action that produced it.

### Licence for adapted material

The source's [MIT licence](https://github.com/Imperial-FoNS-Computing/FoNS-installation-instructions/blob/1be8fde4644644ddbae5766028167fd33dc38854/LICENSE) is reproduced below for the adapted material. This does not change the licence of the rest of MQB or of third-party images.

```text
MIT License

Copyright (c) 2020 Imperial-Maths-Computing

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
