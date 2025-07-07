# upgrade-helpers

![Shell](https://img.shields.io/badge/script-bash-green?logo=gnu-bash&logoColor=white)

Simple Bash functions to selectively upgrade packages on Ubuntu or Debian using APT.

## Available functions

### `upgrade-exclude <regex>`
Upgrades all packages available **except** those matching the given regex.

Example:
```bash
upgrade-exclude "nvidia|xserver"
```

### `upgrade-only <regex>`
Upgrades **only** the packages matching the given regex.

Example:
```bash
upgrade-only "firefox|vlc"
```

---

## How to see which packages are upgradable

Before running any upgrade, you can check which packages are available to upgrade on your system using:

First, update the package list:
```bash
sudo apt update
```

Then, check which packages are upgradable:
```bash
apt list --upgradable
```

This shows all packages with newer versions available according to your configured repositories.

---

## Installation

**Important:**  
For simplicity, it is recommended that you clone this repository directly into your home directory (`~/`).  
This way, the example paths below will work exactly as written.

Clone the repository:

```bash
cd ~
git clone https://github.com/your-username/upgrade-helpers.git
```

---

## Configure your shell

Assuming you cloned this repository into your home directory (`~/`), add the following line to your shell configuration file:

For **Zsh**:
```bash
echo "source ~/upgrade-helpers/upgrade-helpers.sh" >> ~/.zshrc
```

For **Bash**:
```bash
echo "source ~/upgrade-helpers/upgrade-helpers.sh" >> ~/.bashrc
```

---

## Reload your shell

To load the new functions immediately without opening a new terminal:

For **Zsh**:
```bash
source ~/.zshrc
```

For **Bash**:
```bash
source ~/.bashrc
```

---

## License

MIT License. See [LICENSE](LICENSE).
