# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY test.py .

# Run test.py when the container launches
CMD ["python", "-u", "test.py"]