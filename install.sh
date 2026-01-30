#!/bin/bash
# LinkedIn Automator Installer for Claude Code

REPO="charlesdove977/linkedin-automator"
COMMANDS_DIR="$HOME/.claude/commands"
TEMP_DIR=$(mktemp -d)

echo "Installing LinkedIn Automator..."

# Clone repo
git clone --depth 1 "https://github.com/$REPO" "$TEMP_DIR" 2>/dev/null

if [ $? -ne 0 ]; then
  echo "Error: Failed to clone repository. Check your internet connection."
  rm -rf "$TEMP_DIR"
  exit 1
fi

# Create commands directory if needed
mkdir -p "$COMMANDS_DIR"

# Symlink each command
for cmd in linkedinoutreach linkeddmconnections linkedanswerdm linkedinpost linkedconnect; do
  if [ -f "$TEMP_DIR/commands/$cmd.md" ]; then
    ln -sf "$TEMP_DIR/commands/$cmd.md" "$COMMANDS_DIR/$cmd.md"
    echo "  ✓ /$cmd"
  fi
done

echo ""
echo "Installation complete! Restart Claude Code, then run:"
echo "  /linkedinoutreach"
