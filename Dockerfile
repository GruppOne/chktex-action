FROM python:3.7-slim-buster

LABEL "repository"="http://github.com/GruppOne/chktex-action"
LABEL "maintainer"="GruppOne <gruppone.swe@gmail.com>"

# hadolint ignore=DL3008
RUN apt-get update && apt-get install --no-install-recommends -y \
  chktex \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /tmp/action
COPY requirements.txt ./
RUN pip3 install -r requirements.txt

COPY . .

ENTRYPOINT [ "python3", "/tmp/action/run_action.py" ]
