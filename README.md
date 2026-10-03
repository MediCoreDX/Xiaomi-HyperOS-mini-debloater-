# Xiaomi HyperOS / MIUI App-Entferner für Android 16

Dieses Bash-Skript nutzt Android Debug Bridge (ADB), um eine kleine, fest codierte Liste von Apps nur für den aktuell aktiven Android-Benutzer zu entfernen. Es benötigt kein Root und entfernt die Pakete nicht aus dem Systemimage.

## Voraussetzungen

- Bash
- Android Platform Tools (`adb`)
- USB-Debugging aktiviert und der Computer auf dem Telefon autorisiert
- Genau ein autorisiertes ADB-Gerät verbunden

## Ausführung

Verbinde das Gerät und autorisiere es, dann starte:

```bash
bash "Xiaomi HyperOS mini debloade"
```

Das Skript zeigt das gewählte Gerät, die Android-Benutzer-ID und die Paketliste an und verlangt eine explizite Bestätigung, bevor Änderungen vorgenommen werden. Pakete werden nach exakter Paket-ID verglichen. Nicht installierte Apps werden übersprungen.

## Android 16 Hinweise

- Das Skript erkennt die Android-Version (`ro.build.version.sdk`) und prüft die Benutzer-ID robuster.
- Falls `pm uninstall --user` auf einem HyperOS-/Android-16-Build nicht wie erwartet funktioniert, versucht das Skript automatisch einen Fallback über `pm disable-user`.
- Das Entfernen gilt nur für den aktuellen Nutzer; es entfernt keine systemweiten Apps aus dem Gerätesystem.

## Wichtig

Die Paketliste ist ein Ausgangspunkt, kein allgemeines „Muss-Entfernen“-Set für jedes Xiaomi-Gerät oder jede OS-Version. Das Entfernen kann Funktionen deaktivieren, die von den betroffenen Apps abhängen. Prüfe die Liste sorgfältig und verstehe die Auswirkungen, bevor du bestätigst.

Um eine App für einen Benutzer wiederherzustellen, sofern das Systempaket noch vorhanden ist:

```bash
adb -s DEVICE_SERIAL shell cmd package install-existing --user USER_ID PACKAGE_ID
```

Ersetze `DEVICE_SERIAL` durch die Seriennummer aus dem Skript, `USER_ID` durch die angezeigte Android-Benutzer-ID und `PACKAGE_ID` durch den Paketnamen, zum Beispiel `com.miui.analytics`.
