# Use official Python base image
FROM python:3.10

# Set working directory inside container
WORKDIR /app

# Copy all project files into the container
COPY . /app

# Install dependencies
RUN pip install -r requirements.txt

# Run the app
CMD ["python", "app.py"]
