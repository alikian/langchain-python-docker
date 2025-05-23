# Use Python 3.12 base image
FROM python:3.12-slim

# Install system dependencies
RUN apt update && apt install -y build-essential python3-dev liblz4-dev

# Set working directory
WORKDIR /app
RUN echo "📂 Working directory set to /app"

# Copy project files
COPY requirements.txt /app
RUN echo "📂 Project files copied to /app"

# Create and activate virtual environment
RUN python -m venv venv
RUN . venv/bin/activate

# Upgrade pip and install dependencies
RUN pip install --no-cache-dir --upgrade pip setuptools wheel

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt