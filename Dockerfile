# Base image
# Python 3.9 doesn't install scikit-learn correctly
FROM python:3.9-slim-buster

WORKDIR /usr/src/app

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Install Poetry for package management
RUN pip3 install --upgrade pip setuptools wheel && \
    pip3 install poetry==1.1.11 && \
    # Install curl for the Docker healthcheck, for zero-downtime deployment with Docker Swarm
    apt-get update && \
    apt-get install -y curl netcat && \
    # Clean up
    apt-get autoremove -y && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/*

# Install packages with Poetry
COPY pyproject.toml /
RUN poetry config virtualenvs.create false && \
  poetry install --no-interaction --no-ansi --no-dev

COPY . .

# # Copy the main app folder to the container
# COPY app app
# # Copy some other files in the root directory
# COPY wsgi.py gunicorn-cfg.py .env entrypoint.sh /

# # Let Flask know where to start
# ENV FLASK_APP wsgi.py
# EXPOSE 5000

# # Commands to run on container startup
# CMD ["/bin/bash", "/entrypoint.sh"]
