FROM python:3
MAINTAINER C Killua "ckillua8q8junkmail@gmail.com"

ENV DEBIAN_FRONTEND noninteractive
ENV APT_MIN_INSTALL 'apt-get install -y --no-install-recommends'

RUN apt-get update
RUN $APT_MIN_INSTALL apt-utils
RUN $APT_MIN_INSTALL apt-transport-https

RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
RUN curl https://packages.microsoft.com/config/debian/9/prod.list > /etc/apt/sources.list.d/mssql-release.list
RUN apt-get update && ACCEPT_EULA=Y $APT_MIN_INSTALL msodbcsql17 unixodbc-dev

ENV DEBIAN_FRONTEND teletype

COPY dsn.ini /root/.odbc.ini

COPY requirements.txt .
RUN python3 -m pip install -r requirements.txt

WORKDIR /notebooks

COPY notebooks/. .

EXPOSE 8888

ENTRYPOINT [ "jupyter", "notebook", "--ip", "0.0.0.0", "--allow-root" ]
