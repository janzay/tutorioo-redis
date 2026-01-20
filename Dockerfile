FROM redis:7-alpine

# Copy config to a location that won't be overwritten by the persistent disk
COPY redis.conf /usr/local/etc/redis/redis.conf

# Create data directory and set permissions
RUN mkdir -p /data && chown redis:redis /data

# Set working directory
WORKDIR /data

# Expose the port
EXPOSE 10000

# Run redis with the config - password is passed via command line from Render
CMD ["redis-server", "/usr/local/etc/redis/redis.conf"]
