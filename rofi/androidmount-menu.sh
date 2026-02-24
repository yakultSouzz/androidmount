#!/data/data/com.termux/files/usr/bin/bash

THEME="$HOME/.config/rofi/themes/androidmount.rasi"
BASE="$HOME/storage/Android_Mount"

mkdir -p "$(dirname "$THEME")"

[ -f "$THEME" ] || cat > "$THEME" <<EOF
configuration {
    font: "JetBrains Mono 12";
    width: 450;
    lines: 8;
}
* {
    background: #1a1b26;
    foreground: #a9b1d6;
    selected-background: #24283b;
    border-color: #7aa2f7;
}
EOF

mounted=$(androidmount status | grep -o "📱")

if androidmount status | grep -q "📱"; then

    options=""
    while read -r mp; do
        name=$(basename "$mp")
        size=$(df -h "$mp" 2>/dev/null | awk 'NR==2 {print $4 " livre"}')
        options+="📂 $name ($size)\n"
    done < <(awk '$3 ~ /simple-mtpfs/ {print $2}' /proc/mounts)

    options+="\n⏏️ Desmontar todos\n❌ Fechar"

    choice=$(echo -e "$options" | rofi -dmenu -p "Dispositivos Montados" -theme "$THEME")

    case "$choice" in
        📂*)
            name=$(echo "$choice" | awk '{print $2}')
            xdg-open "$BASE/$name"
        ;;
        *Desmontar*)
            androidmount unmount
        ;;
    esac

else

    devices=$(androidmount list)

    [ -z "$devices" ] && {
        rofi -e "Nenhum dispositivo detectado"
        exit
    }

    options=""
    while read -r line; do
        num="${line%%:*}"
        name="${line#*: }"
        options+="📲 $name::$num\n"
    done <<< "$devices"

    choice=$(echo -e "$options" | rofi -dmenu -p "Montar dispositivo" -theme "$THEME")

    name=$(echo "$choice" | sed 's/📲 //' | cut -d: -f1)
    num=$(echo "$choice" | cut -d: -f3)

    [[ -n "$num" ]] && androidmount mount "$num" "$name"
fi