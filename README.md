# PingStorm

PingStorm is a Bash tool that measures and compares internet latency to several major online services. It simulates a basic "speed test" by checking how quickly websites respond to a ping, then analyzes and visualizes the results.

## Features

* **Target Service List:** Includes a predefined list of major online platforms (e.g., google.com, facebook.com, tiktok.com). The tool loops through each service for testing.
    
* **Ping Execution:** Sends multiple pings to each domain and extracts the average latency. It handles errors gracefully (e.g., unreachable host).
    
* **Result Analysis:** Identifies the fastest and slowest responding services, calculates an overall average latency, and produces a sorted ranking by speed.
    
* **Terminal Visualization:** Displays latency data in a user-friendly format using aligned text or ASCII bar charts. The fastest and slowest results are visually distinguished.
      
* **Logging System:** Logs all key actions and results to a central file (`pingstorm.log`) with timestamps and module identifiers.

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
