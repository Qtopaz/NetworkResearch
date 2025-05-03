# Remote Control – Anonymous SSH Network Scanner via Tor & SSH

**Remote Control** is a Bash-based automation tool that enables remote command execution and SSH scanning over a target network while maintaining anonymity via the Tor network. It leverages tools like `nipe`, `nmap`, `sshpass`, and `geoiplookup`.

---

## 🧰 Features

- Automatically installs and sets up [nipe](https://github.com/htrgouvea/nipe) to route traffic through Tor
- Verifies anonymity using `geoiplookup` and changes IP if required
- Scans remote networks for open SSH ports using `nmap`
- Connects via SSH using `sshpass` for password-based authentication
- Anonymous execution from start to finish

---

## 📦 Requirements

Ensure you're running the script on a Debian-based system (e.g., Kali Linux) as root.

The following tools are installed automatically if missing:
- `nipe`
- `geoip-bin`
- `curl`
- `nmap`
- `sshpass`
- `ssh`
- Perl modules: `Try::Tiny`, `Config::Simple`, `JSON`

---

## 🚀 Usage

```bash
chmod +x remote_control.sh
sudo ./remote_control.sh
