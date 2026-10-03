#!/usr/bin/env bash

# Installationshilfe für Xiaomi HyperOS Mini Debloater
# Dieses Skript hilft bei der Installation der Abhängigkeiten

set -Eeuo pipefail

echo "=========================================="
echo "Xiaomi HyperOS Mini Debloater - Setup"
echo "=========================================="
echo

check_bash() {
  if [[ ${BASH_VERSINFO[0]} -lt 4 ]]; then
    echo "Fehler: Bash 4.0+ erforderlich. Du hast Bash ${BASH_VERSINFO[0]}.${BASH_VERSINFO[1]}"
    exit 1
  fi
  echo "✓ Bash ${BASH_VERSINFO[0]}.${BASH_VERSINFO[1]} gefunden"
}

check_adb() {
  if command -v adb >/dev/null 2>&1; then
    local version
    version=$(adb version 2>&1 | head -n 1)
    echo "✓ ADB installiert: $version"
    return 0
  fi

  echo "✗ ADB nicht gefunden"
  echo
  echo "Installationsanleitung für dein System:"
  echo

  if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    echo "Linux:"
    echo "  Ubuntu/Debian: sudo apt-get install android-tools-adb"
    echo "  Fedora: sudo dnf install android-tools"
    echo "  Arch: sudo pacman -S android-tools"
  elif [[ "$OSTYPE" == "darwin"* ]]; then
    echo "macOS:"
    echo "  Mit Homebrew: brew install android-platform-tools"
    echo "  Oder: https://developer.android.com/studio/releases/platform-tools"
  elif [[ "$OSTYPE" == "msys" ]] || [[ "$OSTYPE" == "cygwin" ]]; then
    echo "Windows:"
    echo "  Lade herunter: https://developer.android.com/studio/releases/platform-tools"
    echo "  Oder mit Chocolatey: choco install android-sdk"
  fi
  echo
  return 1
}

check_usb_debugging() {
  if ! adb devices 2>&1 | grep -q "device"; then
    echo "⚠ Keine Geräte verbunden oder USB-Debugging nicht aktiviert"
    echo
    echo "Schritte:"
    echo "  1. Verbinde dein Xiaomi-Gerät über USB"
    echo "  2. Aktiviere USB-Debugging in den Entwickler-Optionen:"
    echo "     Einstellungen → Über das Telefon → MIUI-Version 7x tippen"
    echo "  3. Akzeptiere die Autorisierungsaufforderung auf dem Gerät"
    echo "  4. Führe dann aus: adb devices"
    echo
    return 1
  fi

  echo "✓ ADB-Gerät gefunden und verbunden"
  return 0
}

main() {
  echo "Überprüfe Voraussetzungen..."
  echo

  check_bash
  echo

  if ! check_adb; then
    echo
    echo "Bitte installiere Android Platform Tools und versuche erneut."
    exit 1
  fi
  echo

  if ! check_usb_debugging; then
    echo
    echo "Bitte aktiviere USB-Debugging und verbinde dein Gerät erneut."
    exit 1
  fi
  echo

  echo "=========================================="
  echo "✓ Alles bereit!"
  echo "=========================================="
  echo
  echo "Du kannst das Debloater-Skript jetzt ausführen:"
  echo
  echo "  bash \"Xiaomi HyperOS mini debloade\""
  echo
  echo "Oder im Dry-Run-Modus zum Testen:"
  echo
  echo "  DRY_RUN=true bash \"Xiaomi HyperOS mini debloade\""
  echo
}

main "$@"
