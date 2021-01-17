FROM python:3.8

# update and install pip/vim
RUN apt-get update && apt-get install -y vim python3-pip

# Set display port as an environment variable
#ENV DISPLAY=99

RUN mkdir /app

# copy the app
COPY  requirements.txt app_b.py database.db /app/
WORKDIR /app
RUN pip3 install -r requirements.txt

#CMD ["python3", "app_b.py"]


