FROM node:21-alpine

WORKDIR /home/projects

RUN apk add --update wget
RUN apk add --update unzip

RUN apk add --update bash
RUN apk add --update freetype
RUN apk add --no-cache fontconfig ttf-dejavu

RUN apk search openjdk17
RUN apk add openjdk17

RUN apk add --update git

RUN wget https://github.com/nexiality/nexial-installer/releases/download/nexial-installer-v1.4.7/nexial-installer-1.4.7.zip
RUN unzip /home/projects/nexial-installer-1.4.7.zip -d nexial-installer-1.4.7
RUN rm -f /home/projects/nexial-installer-1.4.7.zip

RUN /home/projects/nexial-installer-1.4.7/bin/install-latest.sh
RUN mv /root/projects/nexial-core /home/projects

RUN mkdir -p roompot
WORKDIR /home/projects/roompot
COPY . .
# RUN npm install

WORKDIR /home/projects
RUN git clone https://github.com/dhana555std/nexial-docker.git
RUN mv ./nexial-docker/tests .
RUN rm -rf ./nexial-docker

WORKDIR /home/projects/nexial-core/bin
RUN ./nexial.sh -version

CMD ["./nexial.sh",  "-script", "/home/projects/tests/artifact/script/RestApi.xlsx"]
