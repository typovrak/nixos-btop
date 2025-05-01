# 📊 NixOS Btop

> NixOS module to install btop, a colorful resource monitor, with Catppuccin mocha green theme and secure per-user configuration.

## 📦 Features

- 🔒 **Secure config directory :** Creates ```~/.config/btop``` with ```700``` permissions and correct ownership.

- 🎨 **Catppuccin mocha green theme :** Deploys ```catppuccin_mocha.theme``` into ```~/.config/btop/themes``` for a cohesive look.

- ⚙️ **Config deployment :** Installs ```btop.conf``` into ```~/.config/btop/btop.conf``` with ```600``` permissions.

- 📦 **btop package :** Ensures ```btop``` is installed via ```environment.systemPackages```.

- 🔄 **Idempotent :** Cleans and recreates config/theme folders on each rebuild without removing other user data.

- 💾 **Backup guidance :** Documentation includes commands to back up any existing ```~/.config/btop``` before applying changes.

## ⚙️ Prerequisites

### 1. NixOS version
Requires NixOS 24.11 or newer.

### 2. User validation
the target user must be defined in ```config.username```. See [typovrak main nixos configuration](https://github.com/typovrak/nixos) for more details.

### 3. Backup
Before proceeding, back up existing configuration if needed
```bash
cp ~/.config/btop{,.bak}
```

## 🚀 Installation
Fetch the module directly in your main nixos configuration at ```/etc/nixos/configuration.nix``` using fetchGit
```nix
# /etc/nixos/configuration.nix

let
  nixos-btop = fetchGit {
    url = "https://github.com/typovrak/nixos-btop.git";
    ref = "main";
    rev = "4ca0d01ee97a74359ddf821718f7d8f400c1bb81"; # update to the desired commit
  };
in
{
  imports = [
    /etc/nixos/hardware-configuration.nix # system hardware settings
    /etc/nixos/variables.nix # defines config.username and other variables, see https://github.com/typovrak/nixos for more details
    (import "${nixos-btop}/configuration.nix")
  ];
}
```

Once imported, rebuild your system to apply changes
```bash
sudo nixos-rebuild switch
```

## 🎬 Usage

Run this monitoring program with
```bash
btop
```

## ❤️ Support

If this module saved you time, please ⭐️ the repo and share feedback.  
You can also support me on ☕ [Buy me a coffee](https://www.buymeacoffee.com/typovrak).

## 📝 License

Distributed under the [MIT license](LICENSE.md).

## 📜 Code of conduct

This project maintains a [code of conduct](.github/CODE_OF_CONDUCT.md) to ensure a respectful, inclusive and constructive community.

## 🛡️ Security

To report vulnerabilities or learn about supported versions and response timelines, please see our [security policy](.github/SECURITY.md).

---

<p align="center"><i>Made with 💜 by typovrak</i></p>
