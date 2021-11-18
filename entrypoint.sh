#!/bin/bash

echo "Waiting for postgres..."

# Use netcat (nc) to check if the TimescaleDB host/port are accessible
while ! nc -z timescale 5433; do
  sleep 0.1
done

echo "PostgreSQL started"

# Finally, start the Gunicorn app server for the Flask app
gunicorn --config /gunicorn-cfg.py wsgi:app
