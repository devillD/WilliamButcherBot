FROM python:3.9.2-slim-buster
RUN mkdir /BOT && chmod 777 /BOT
WORKDIR /BOT
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y
RUN apt-get install -y wget curl bash git neofetch sudo software-properties-common ffmpeg

#Updating Libraries
COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

# If u want to use /update feature, uncomment the following and edit
#RUN git config --global user.email "your_email"
#RUN git config --global user.name "git_username"

#Copying All Source
COPY . .

#Starting Bot
CMD ["python3", "-m", "wbb"]
