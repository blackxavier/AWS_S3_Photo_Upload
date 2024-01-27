# Use a lightweight Python image as the base
FROM python:3.11.4-slim-buster

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# install system dependencies for the shell script
RUN apt-get update && apt-get install -y netcat && \
    apt-get install -y --no-install-recommends gcc

# create the app user
RUN addgroup --system app && adduser --system --group app

# Create and set the working directory
WORKDIR /usr/src/app

# create the appropriate directories
ENV HOME=/usr/src/app
RUN mkdir $HOME/staticfiles


# Install dependencies
COPY requirements.txt $HOME
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
RUN pip wheel --no-cache-dir --no-deps --wheel-dir /usr/src/app/wheels -r requirements.txt

# Copy the Django app code
COPY . $HOME

# copy entrypoint.sh
RUN sed -i 's/\r$//g' $HOME/entrypoint/entrypoint.sh  
RUN chmod +x $HOME/entrypoint/entrypoint.sh 
RUN chown -R app:app $HOME

# Expose the port your app runs on
EXPOSE 8000

# Command to run your application
CMD ["python", "manage.py" ,"runserver" ,"0.0.0.0:8000"]
