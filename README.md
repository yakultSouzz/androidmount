# AndroidMount Pro

Mount Android devices (MTP) directly from Termux/Linux with:

- Polybar integration
- Rofi interactive menu
- Multi-device support
- Smart status detection
- Logging system
- Robust mount/unmount handling

## ✨ Features

- Multiple devices supported
- Intelligent mountpoint naming
- Lazy unmount fallback
- Desktop & Termux notifications
- Polybar module ready
- Rofi GUI menu
- Logging + debug mode
- Safe locking system

---

## 📦 Requirements

- simple-mtpfs
- fusermount
- rofi (optional)
- polybar (optional)
- notify-send or termux-notification

---

## 🚀 Installation

```bash
git clone https://github.com/yakultSouzz/androidmount.git
cd androidmount
chmod +x install.sh
./install.sh
```

---

## 🧠 Usage

```bash
androidmount list
androidmount mount <num> <name>
androidmount unmount
androidmount status
androidmount detailed
```

Enable debug:

```bash
DEBUG=1 androidmount status
```

---

## 🎛 Polybar

Add to your bar:

```ini
include-file = ~/.config/polybar/modules/androidmount.ini
```

---

## 📜 License

MIT License
