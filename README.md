# Xiaomi HyperOS / MIUI App-Entferner für Android 16+

Dieses Bash-Skript nutzt Android Debug Bridge (ADB), um eine fest definierte Liste von bloatware-Apps nur für den aktuellen Android-Benutzer zu entfernen. Es benötigt **kein Root** und entfernt die Pakete nicht permanent aus dem Systemimage.

## Features

✅ **Android 16+ vollständig unterstützt**  
✅ **Robuste Fehlerbehandlung** mit automatischen Fallbacks  
✅ **Benutzerfreundliche Ausgabe** mit Farben und klaren Meldungen  
✅ **Mehrere Entfernungsmethoden**: `pm uninstall`, `pm disable-user`, `pm hide`  
✅ **Geräte-Info-Anzeige** (Modell, Android-Version, SDK-Level)  
✅ **Dry-Run-Modus** zum Testen ohne Änderungen  
✅ **Sichere Bestätigung** vor Änderungen  
✅ **Fehlertoleranz** bei fehlenden oder blockierten Paketen

## Anforderungen

- **Bash** (moderne Version)
- **Android Platform Tools** (`adb`)
- **USB-Debugging** aktiviert auf dem Gerät
- **Autorisierung** des Computers auf dem Telefon
- **Genau ein ADB-Gerät** verbunden

## Installation

```bash
# Repository klonen
git clone https://github.com/MediCoreDX/Xiaomi-HyperOS-mini-debloater-.git
cd Xiaomi-HyperOS-mini-debloater-

# Skript ausführbar machen
chmod +x "Xiaomi HyperOS mini debloade"
```

## Ausführung

### Standard-Modus
```bash
bash "Xiaomi HyperOS mini debloade"
```

### Dry-Run (nur Vorschau, keine Änderungen)
```bash
DRY_RUN=true bash "Xiaomi HyperOS mini debloade"
```

### Mit benutzerdefinierten ADB-Pfad
```bash
ADB_BIN=/path/to/custom/adb bash "Xiaomi HyperOS mini debloade"
```

## Workflow

1. **Geräteprüfung**: Verifiziert, dass genau ein Gerät verbunden und autorisiert ist
2. **Informationen sammeln**: Erfasst Gerätemodell, Android-Version, SDK-Level
3. **Benutzer-ID**: Erkennt automatisch die aktive Benutzer-ID
4. **Bestätigung**: Zeigt die Apps an und verlangt Bestätigung (`j` eingeben)
5. **Entfernung**: Versucht, jede App zu entfernen, mit automatischen Fallbacks
6. **Bericht**: Zeigt eine Zusammenfassung mit erfolgreichen und fehlgeschlagenen Apps

## Entfernte Apps

- `com.miui.msa.global` – MIUI Analytics
- `com.miui.analytics` – MIUI Datenerfassung
- `com.xiaomi.adservice` – Xiaomi Ad Service
- `com.facebook.appmanager` – Facebook App Manager
- `com.facebook.services` – Facebook Services
- `com.miui.mipicks` – Xiaomi Picks
- `com.mi.globalbrowser` – Xiaomi Browser
- `com.miui.videoplayer` – MIUI Video Player

## Fehlerbehandlung

Das Skript ist für Android 16+ optimiert und verwendet mehrere Fallback-Methoden:

1. **`pm uninstall --user`** – Entfernt die App für den Nutzer
2. **`pm disable-user`** – Deaktiviert die App für den Nutzer (wenn Entfernung blockiert)
3. **`pm hide`** – Versteckt die App (letzter Ausweg bei Systempaketen)

Falls keine Methode funktioniert, wird dies klar angezeigt, ohne dass das Skript abstürzt.

## Android 16 Spezifika

- Bessere Benutzer-ID-Erkennung für Multi-User-Setups
- Automatische Fallback-Kette für strengere Sicherheitsbeschränkungen
- SDK-Level-Erkennung für Kompatibilität
- Robuste CRLF-Behandlung für verschiedene ADB-Ausgaben
- Unterstützung für HyperOS-spezifische Beschränkungen

## Wiederherstellen einer App

Wenn eine App für den Benutzer noch im Systemimage vorhanden ist, kann sie wiederhergestellt werden:

```bash
adb -s DEVICE_SERIAL shell cmd package install-existing --user USER_ID PACKAGE_ID
```

Beispiel:
```bash
adb shell cmd package install-existing --user 10 com.miui.analytics
```

## Wichtige Hinweise

⚠️ **Die Paketliste ist ein Ausgangspunkt, nicht garantiert für alle Geräte/Versionen sicher**

- Das Entfernen kann Gerätefunktionen deaktivieren, die von diesen Apps abhängen
- Prüfe die Liste genau und verstehe die Auswirkungen, bevor du bestätigst
- Diese Operation gilt **nur für den aktuellen Benutzer**, nicht systemweit
- Blockierte Systempakete werden deaktiviert statt gelöscht

## Troubleshooting

### „Es muss genau ein ADB-Gerät verbunden sein"
- Stelle sicher, dass nur ein Gerät über USB verbunden ist
- Führe `adb devices` aus, um verbundene Geräte zu sehen

### „ADB-Gerät ist nicht autorisiert"
- Aktiviere USB-Debugging auf dem Gerät
- Akzeptiere die Autorisierungsaufforderung auf dem Gerät
- Trenne und verbinde das Gerät neu

### „Android-Benutzer konnte nicht ermittelt werden"
- Das Skript versucht mehrere Methoden; wenn alle fehlschlagen, wird User 10 (Standard) verwendet
- Falls das nicht funktioniert, übergib die User-ID manuell (erweiterte Option in Zukunft)

### Apps lassen sich nicht entfernen
- Manche Systempakete können nur deaktiviert werden (wird dann mit Fallback gehandhabt)
- Prüfe, ob das Gerät Multi-User-Beschränkungen aktiviert hat
- Versuche, das Gerät neu zu booten

## Lizenz

Dieses Projekt wird ohne Gewährleistung bereitgestellt. Nutze es auf eigenes Risiko.

## Support

Für Issues, Fragen oder Verbesserungsvorschläge: [GitHub Issues](https://github.com/MediCoreDX/Xiaomi-HyperOS-mini-debloater-/issues)
