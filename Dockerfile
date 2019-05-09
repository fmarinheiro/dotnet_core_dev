FROM mcr.microsoft.com/dotnet/core/sdk:latest

ENV APP_FOLDER=workspace
ENV HOME=/home/app
ENV APP_HOME=${HOME}/${APP_FOLDER}

ENV HUID=1000
ENV HGID=1000

ENV DOTNET_CLI_TELEMETRY_OPTOUT=1

RUN apt update && \
    apt install unzip && \
    curl -sSL https://aka.ms/getvsdbgsh | /bin/sh /dev/stdin -v latest -l /vsdbg

RUN mkdir -p $HOME
RUN mkdir $APP_HOME

WORKDIR $APP_HOME

ADD . $APP_HOME

RUN mv become.sh ../
RUN chmod o+x ../become.sh

ENTRYPOINT ["../become.sh"]