# Python runtime
FROM python:3.9-slim

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install python3-venv
RUN apt-get update && apt-get install -y python3-venv

# Creating a virtual environment and activate it
RUN python3 -m venv venv
ENV VIRTUAL_ENV=/app/venv
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

# Installing needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Installing Curl
RUN apt-get update && apt-get install -y curl

# Make port 80 available to the world outside this container
EXPOSE 80

# Environment variable
ENV NAME World

# Run app.py when the container launche
CMD ["python", "app.py"] 
