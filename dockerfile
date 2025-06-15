# use a light weight base image
FROM python:3.9-slim

# set environment variable to prevent Python from writing .pyc file buffer output
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# set the working directory inside the container
WORKDIR /app

# Copy only required files
COPY requirements.txt /app/
COPY app.py /app/
COPY templates /app/templates
COPY static /app/static

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose the port the app runs on
EXPOSE 5000

# run the application
CMD [ "python", "app.py"]