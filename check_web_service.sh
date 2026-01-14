#!/bin/bash

# Check web server port 80
if ! timeout 2 bash -c "echo > /dev/tcp/127.0.0.1/80" 2>/dev/null; then
    echo "Port 80 not available"
    exit 1
fi

# Check index.html file
if [ ! -f "/var/www/html/index.html" ]; then
    echo "index.html not found"
    exit 1
fi

# Check if file is not empty
if [ ! -s "/var/www/html/index.html" ]; then
    echo "index.html is empty"
    exit 1
fi

echo "All checks passed"
exit 0