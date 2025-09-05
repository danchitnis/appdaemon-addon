FROM python:3.11-slim

# Set up AppDaemon manually
RUN pip install appdaemon

# Copy your config (you can mount external config instead)
COPY run.sh /run.sh
RUN chmod +x /run.sh
