You can see all logs for a Docker container named `<container-name>` using these commands:

## Basic command to see all logs:
```bash
docker logs <container-name>
```

## More useful variants:

**With timestamps:**
```bash
docker logs --timestamps <container-name>
```

**Follow new logs in real-time (like tail -f):**
```bash
docker logs --follow <container-name>
```

**Show last N lines only:**
```bash
docker logs --tail 100 <container-name>
```

**Since a specific time:**
```bash
docker logs --since 2024-01-01T10:00:00 <container-name>
# or since X minutes ago
docker logs --since 30m <container-name>
```

**Until a specific time:**
```bash
docker logs --until 2024-01-01T20:00:00 <container-name>
```

**Combining options (e.g., follow, show last 50 lines, with timestamps):**
```bash
docker logs --follow --tail 50 --timestamps <container-name>
```

## Troubleshooting:
If you get no output, the container might not be running. Check its status:
```bash
docker ps -a | grep <container-name>
```

If the container isn't logging to stdout/stderr, check if logs are being written to files inside the container instead. You might need to `docker exec` into it:
```bash
docker exec -it <container-name> bash
# then check application logs in their expected location
```

Note: The `docker logs` command only shows logs from the container's stdout/stderr, not from files written inside the container.
