# PingStorm

**Note: This is a simplified exercise/assignment, not a production-ready tool.**

PingStorm is a Bash tool that measures and compares internet latency to several online services. It simulates a basic "speed test" by checking how quickly websites respond to a ping, then analyzes and visualizes the results.

## Usage

The main script `PingStorm.sh` requires a filename as a parameter. This file should contain a list of domains to test, one domain per line.

```bash
./PingStorm.sh <domains_file>
```
## Output Example
Fastest: google.com (13.355 ms)

Slowest: tiktok.com (64.871 ms)

google.com | █████ 13.355 ms

youtube.com | █████ 14.719 ms

facebook.com | ████████████████████████ 63.073 ms

tiktok.com | █████████████████████████ 64.871 ms
