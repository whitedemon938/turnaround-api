# Base image with Python
FROM python:3.9-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements.txt file to the working directory
COPY requirements.txt .

# Install the Python dependencies and Playwright browsers
RUN pip install --no-cache-dir -r requirements.txt \
    && python -m playwright install

# Copy the rest of the application files to the working directory
COPY . .

# Expose port 5000 for the app
EXPOSE 5000

# Set environment variables for Playwright to run in a container
ENV PYTHONUNBUFFERED=1 \
    PLAYWRIGHT_BROWSERS_PATH=/ms-playwright

# Run the Python server
CMD ["python", "main.py"]
