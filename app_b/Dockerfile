FROM python:3.8
#RUN apt-get install software-properties-common
RUN apt-get update && apt-get install -y gnupg2 software-properties-common vim python3-pip

# Set display port as an environment variable
#ENV DISPLAY=99
RUN mkdir /app
#WORKDIR /app
#COPY ["requirements.txt", "app_a.py", "app_b.py", "schema.sql"] .



# copy the scraper app
COPY  requirements.txt app_a.py /app
WORKDIR /app

#RUN pip3 install --upgrade wheel setuptools
RUN pip3 install -r requirements.txt


#CMD ["python3", "./container_start.sh"]


## START HERE
# change from a python image to an ubuntu image, that might be easier
# install python
# write the code to pip install webdriver manager 
# try the web drivermanagerfirst, that may work easiest. Then try installs below.https://pypi.org/project/webdriver-manager/



