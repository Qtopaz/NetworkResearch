# Remote Control – Anonymous SSH Network Scanner

Remote Control is a Bash-based tool that automates anonymous SSH scanning and remote access using the Tor network. It leverages Nipe, Nmap, sshpass, and geoiplookup to provide stealthy scanning capabilities across internal networks.

---

## 🧰 Features

- Routes all traffic anonymously via the Tor network using `nipe`
- Verifies non-Israeli (non-IL) IP using `geoiplookup` before proceeding
- Prompts user for target IP, SSH username, and password
- Scans entire /24 subnet for devices with port 22 open using `nmap`
- Connects to remote targets using `sshpass` for automated SSH login
- Ideal for internal lab simulations and Red Team automation

---

## 📦 Requirements

Must run as **root** on a Debian-based system (e.g., Kali Linux).  
The script will auto-install the following if not already present:

- `nipe` (from GitHub)
- `geoip-bin`
- `nmap`
- `curl`
- `sshpass`
- `perl`, plus Perl modules:
  - `Try::Tiny`
  - `Config::Simple`
  - `JSON`

To manually install Perl modules:

```bash
cpan Try::Tiny Config::Simple JSON


