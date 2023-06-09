FROM openjdk:17-alpine

WORKDIR /home/projects

RUN apk add --update wget
RUN apk add --update unzip
RUN apk add --update bash
RUN apk add --update freetype
RUN apk add --no-cache fontconfig ttf-dejavu

RUN wget https://github.com/nexiality/nexial-installer/releases/download/nexial-installer-v1.4.7/nexial-installer-1.4.7.zip
RUN unzip /home/projects/nexial-installer-1.4.7.zip -d nexial-installer-1.4.7

RUN /home/projects/nexial-installer-1.4.7/bin/install-latest.sh
RUN mv /root/projects/nexial-core /home/projects

CMD ["./nexial-core/bin/nexial.sh",  "-version"]
