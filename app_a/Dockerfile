FROM python:3.8
#not valid error - sync wsl2 time if you get error
#sudo ntpdate pool.ntp.org

# update and install pip/vim
RUN apt-get update && apt-get install -y vim python3-pip

# Set display port as an environment variable
#ENV DISPLAY=99

RUN mkdir /app

# copy the app
COPY  requirements.txt test_hello.py test_jobs.py app_a.py /app/
WORKDIR /app
RUN pip3 install -r requirements.txt

#CMD ["python3", "app_a.py"]


