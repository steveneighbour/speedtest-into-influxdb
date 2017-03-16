# SpeedTest Into InfluxDB

Tiny container that use SpeedTest CLI to monitor bandwidth and send to InfluxDB

# How to use

With a few environment parameters you can setup your InfluxDB settings and the frequency time.

- EXTRA_TAGS="host=EzOffice,location=betim"
- INFLUXDB_DATABASE="speedtest"
- INFLUXDB_HOST="influxdb"
- INFLUXDB_PASSWORD="yourpassword"
- INFLUXDB_PORT=80
- SPEEDTEST_FRQUENCY=60

# Credit

The speedtest scripts is based on [this](https://gist.github.com/shadone/e75f5e2b30a7317201ff) gist.
