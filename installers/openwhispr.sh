#!/bin/bash
set -e

echo "=== OpenWhispr Setup for Pop!_OS (X11) ==="

echo "==> Installing system dependencies..."
sudo apt update -y
sudo apt install -y \
    python3-pip \
    libportaudio2 \
    libportaudio-dev \
    libasound2-dev \
    libssl-dev \
    libffi-dev \
    libmp3lame-dev \
    x11-utils \
    wget

echo "==> Installing OpenWhispr and Python dependencies..."
pip3 install --break-system-packages \
    faster-whisper \
    pyaudio \
    pvwhisper \
    openwhispr \
    pynput

WHISPER_DIR="$HOME/.local/share/whisper"
MODEL_PATH="$WHISPER_DIR/ggml-small.bin"

echo "==> Downloading Whisper small English model (if not present)..."
mkdir -p "$WHISPER_DIR"

if [ ! -f "$MODEL_PATH" ]; then
    echo "Downloading whisper-small.bin to $WHISPER_DIR..."
    wget -q -O "$MODEL_PATH" "https://huggingface.co/ggerganov/whisper.cpp/resolve/main/ggml-small.bin"
    echo "Model downloaded."
else
    echo "Model already exists at $MODEL_PATH"
fi

echo "==> Configuring push-to-talk with Right Alt as trigger..."

CONFIG_DIR="$HOME/.config/openwhispr"
mkdir -p "$CONFIG_DIR"

cat > "$CONFIG_DIR/config.yaml" << 'EOF'
push_to_talk:
  trigger_key: "right_alt"
  mode: "hold"

whisper:
  model: "small"
  language: "en"
  model_dir: "~/.local/share/whisper"

audio:
  sample_rate: 16000
  channels: 1

output:
  copy_to_clipboard: true
  insert_at_cursor: false
EOF

echo "==> Creating systemd user service..."
SYSTEMD_DIR="$HOME/.config/systemd/user"
mkdir -p "$SYSTEMD_DIR"

cat > "$SYSTEMD_DIR/openwhispr.service" << 'EOF'
[Unit]
Description=OpenWhispr Push-to-Talk Service
After=default.target

[Service]
ExecStart=/usr/local/bin/openwhispr
Environment=DISPLAY=:0
Environment=XDG_CONFIG_HOME=%h/.config
Type=simple

[Install]
WantedBy=default.target
EOF

systemctl --user daemon-reload

echo "==> Enabling OpenWhispr to start on login..."
systemctl --user enable openwhispr.service

echo "==> Ensuring ~/.local/bin is in PATH..."
mkdir -p "$HOME/.local/bin"
if [ -f "$HOME/.bashrc" ]; then
    if ! grep -q 'export PATH="$HOME/.local/bin:$PATH"' "$HOME/.bashrc"; then
        echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$HOME/.bashrc"
    fi
fi

if command -v openwhispr &> /dev/null; then
    echo "OpenWhispr is already in PATH."
elif [ -f /usr/local/bin/openwhispr ]; then
    ln -sf /usr/local/bin/openwhispr "$HOME/.local/bin/openwhispr"
    echo "Symlinked openwhispr to ~/.local/bin"
else
    echo "Warning: openwhispr binary not found. It may need to be run differently."
fi

echo ""
echo "=== Setup Complete! ==="
echo ""
echo "NEXT STEPS:"
echo "1. Log out and log back in (or run: source ~/.bashrc)"
echo "2. Start the service manually: systemctl --user start openwhispr"
echo "3. Check status: systemctl --user status openwhispr"
echo "4. View logs: journalctl --user -u openwhispr -f"
echo ""
echo "Usage: Press and hold Right Alt to record, release to transcribe."
echo ""
echo "NOTE: If you added yourself to any new groups, log out and back in for changes to take effect."
