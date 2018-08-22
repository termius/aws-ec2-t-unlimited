FROM python:3.6.5-alpine

WORKDIR app

ADD . /app/

RUN apk --no-cache add curl bash && \
    pip install awscli && \
    curl -O -k --silent https://s3.amazonaws.com/ec2metadata/ec2-metadata && \
    chmod +x ec2-metadata && \
    ln ec2-metadata /usr/bin/

CMD sh make_unlimited.sh
