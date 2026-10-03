# Xiaomi HyperOS Mini Debloater — Android 16+

Schnelles, robustes Shell-Skript zur Entfernung von Bloatware auf Xiaomi-Geräten mit MIUI/HyperOS. Vollständige Unterstützung für **Android 16+**.

## 🚀 Quick Start

```bash
git clone https://github.com/MediCoreDX/Xiaomi-HyperOS-mini-debloater-.git
cd Xiaomi-HyperOS-mini-debloater-
bash "Xiaomi HyperOS mini debloade"
```

## ✨ Features

- ✅ **Android 16+ vollständig unterstützt**
- ✅ **Keine Root erforderlich** — Nur Benutzer-Berechtigungen
- ✅ **Intelligente Fallback-Kette** — uninstall → disable-user → hide
- ✅ **Robuste Fehlerbehandlung** — Funktioniert auf allen Xiaomi/HyperOS-Versionen
- ✅ **Dry-Run-Modus** — Testen ohne Änderungen
- ✅ **Farbige Ausgabe** — Klare, intuitive Rückmeldungen
- ✅ **Multi-User-Support** — Automatische Benutzer-ID-Erkennung
- ✅ **Nur Benutzer betroffen** — Nicht systemweit, einfach wiederherstellbar

## 📋 Anforderungen

| Komponente | Anforderung |
|-----------|-----------|
| Bash | 4.0+ |
| ADB | Android Platform Tools |
| USB-Debugging | Aktiviert auf dem Gerät |
| ADB-Autorisierung | Computer auf Gerät autorisiert |
| Geräte | Genau 1 ADB-Gerät verbunden |

## 🔧 Installation

### macOS (Homebrew)
```bash
brew install android-platform-tools
```

### Linux (Ubuntu/Debian)
```bash
sudo apt-get install android-tools-adb
```

### Linux (Fedora)
```bash
sudo dnf install android-tools
```

### Linux (Arch)
```bash
sudo pacman -S android-tools
```

### Windows
[Offizielle Download-Seite](https://developer.android.com/studio/releases/platform-tools)

## 🎯 Verwendung

### Standard-Modus
```bash
bash "Xiaomi HyperOS mini debloade"
```

### Dry-Run (nur Vorschau, keine Änderungen)
```bash
DRY_RUN=true bash "Xiaomi HyperOS mini debloade"
```

### Benutzerdefinierter ADB-Pfad
```bash
ADB_BIN=/path/to/adb bash "Xiaomi HyperOS mini debloade"
```

## 🗑️ Entfernte Apps

| Paket-ID | Beschreibung |
|---------|-----------|
| `com.miui.msa.global` | MIUI Analytics Global |
| `com.miui.analytics` | MIUI Analytics |
| `com.xiaomi.adservice` | Xiaomi Ad Service |
| `com.facebook.appmanager` | Facebook App Manager |
| `com.facebook.services` | Facebook Services |
| `com.miui.mipicks` | Xiaomi Picks |
| `com.mi.globalbrowser` | Xiaomi Global Browser |
| `com.miui.videoplayer` | MIUI Video Player |

## 🔄 Workflow

1. **Geräteprüfung** — Verbindung & Autorisierung verifizieren
2. **Infos sammeln** — Gerätmodell, Android-Version, SDK-Level, Benutzer-ID
3. **Apps auflisten** — Liste der zu verarbeitenden Pakete anzeigen
4. **Bestätigung** — Explizite Eingabebestätigung (`j` erforderlich)
5. **Intelligente Entfernung**:
   - `pm uninstall --user` (Hauptmethode)
   - `pm disable-user` (Fallback 1)
   - `pm hide` (Fallback 2)
6. **Bericht** — Zusammenfassung mit Erfolgs-/Fehlerzahl

## 🤖 Android 16 Optimierungen

- Verbesserte Benutzer-ID-Erkennung (mehrere Fallback-Methoden)
- Automatische Fallback-Kette für Systempakete
- SDK-Level-Erkennung und -Anzeige
- Robuste Verarbeitung verschiedener ADB-Ausgabeformate
- HyperOS-spezifische Sicherheitsbeschränkungen berücksichtigt

## 🔄 App Wiederherstellen

Falls eine App noch im Systemimage vorhanden ist:

```bash
adb shell cmd package install-existing --user 10 com.miui.analytics
```

Ersetze:
- `10` → deine Benutzer-ID
- `com.miui.analytics` → Paket-ID

## ⚠️ Wichtige Hinweise

**Die Paketliste ist ein Ausgangspunkt, keine Garantie für alle Geräte/Versionen!**

- ⚠️ Das Entfernen **kann Gerätefunktionen deaktivieren**
- ⚠️ Prüfe die Liste **genau**, bevor du bestätigst
- ℹ️ Operation gilt **nur für aktuellen Benutzer**, nicht systemweit
- ℹ️ Blockierte Systempakete werden **deaktiviert statt gelöscht**

## 🐛 Troubleshooting

### „Es muss genau ein ADB-Gerät verbunden sein"

```bash
adb devices
```

✓ Stelle sicher: nur 1 Gerät verbunden, mit `device` Status

### „ADB-Gerät ist nicht autorisiert"

1. Aktiviere USB-Debugging in den **Entwickler-Optionen**
2. Akzeptiere die **Autorisierungsaufforderung** auf dem Gerät
3. Trenne & verbinde das Gerät neu

### „Android-Benutzer konnte nicht ermittelt werden"

Das Skript versucht mehrere Erkennungsmethoden. Fallback: User 10.

```bash
adb shell pm list users
```

### Apps lassen sich nicht entfernen

- ✓ Manche Systempakete können nur **deaktiviert** werden (normal für Android 16+)
- ✓ Prüfe **Multi-User-Beschränkungen**
- ✓ Versuche, das Gerät **neu zu booten**

## 📄 Lizenz

MIT License — Siehe [LICENSE](LICENSE)

## 🤝 Contributing

Issues & Pull Requests: [GitHub](https://github.com/MediCoreDX/Xiaomi-HyperOS-mini-debloater-/issues)

---

**Version:** 2.0.0-android16 | **Zuletzt aktualisiert:** 2026-10-03
"
