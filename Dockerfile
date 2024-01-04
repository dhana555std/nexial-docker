FROM openjdk:17-alpine

WORKDIR /home/projects

RUN apk add --update wget
RUN apk add --update unzip
RUN apk add --update bash
RUN apk add --update freetype
RUN apk add --no-cache fontconfig ttf-dejavu

RUN wget https://github.com/nexiality/nexial-installer/releases/download/nexial-installer-v1.4.7/nexial-installer-1.4.7.zip
RUN unzip /home/projects/nexial-installer-1.4.7.zip -d nexial-installer-1.4.7
RUN rm -f /home/projects/nexial-installer-1.4.7.zip

RUN /home/projects/nexial-installer-1.4.7/bin/install-latest.sh
RUN mv /root/projects/nexial-core /home/projects

COPY tests tests
# WORKDIR /root/.nexial
# RUN mkdir chrome
# RUN wget https://edgedl.me.gvt1.com/edgedl/chrome/chrome-for-testing/120.0.6099.109/win32/chrome-win32.zip
# RUN unzip chrome-win32.zip -d chrome-win32
# RUN rm -f chrome-win32.zip
# TODO  Add code to download chrome dir.

WORKDIR /home/projects/nexial-core/bin
RUN ./nexial.sh -version

CMD ["./nexial.sh",  "-script", "/home/projects/tests/artifact/script/RestApi.xlsx"]
