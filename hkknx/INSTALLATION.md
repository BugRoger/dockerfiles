# System starten

Um das System zu starten, muss die Binärdatei `hkknx` ausgeführt werden.
Folgende Argumente stehen zur Verfügung.

- autoupdate: Aktiviert die automatische Installation von neuen Versionen.
- db: Pfad zum Ordern, in dem Daten gespeichert werden.
- port: Port unter der die Weboberfläche erreichbar ist.
- verbose: Aktiviert Debug Log-Nachrichten.

**Beispiel**

```
./hkknx -db ./database
```

Standardmäßig ist die Weboberfläche unter Port 8080 erreichbar.
Wenn das System auf dem lokalen Rechner gestartet wurde, ist die Weboberfläche unter http://localhost:8080 erreichbar.
Ansonsten muss die IP-Adresse des Rechner, auf dem `hkknx` gestartet wurde, angegeben werden, zB. http://192.168.0.12:8080

Weitere Information finden sich im Online Handbuch.
https://hochgatterer.me/de/hkknx/docs