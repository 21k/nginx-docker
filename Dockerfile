FROM index.alauda.cn/library/ubuntu:trusty
MAINTAINER random_ i@tmxk.org
COPY sources.list /etc/apt/sources.list
COPY nginx.key /nginx.key
ADD http://nodejs.org/dist/v4.4.3/node-v4.4.3-linux-x64.tar.gz  /
RUN apt-key add /nginx.key \
    && apt-get update \
    && apt-get install -y nginx \
        openssh-server \
        git \
        git-core \
        vim \
    && tar xzvf /node-v4.4.3-linux-x64.tar.gz  -C / \
    && cp -r /node-v4.4.3-linux-x64/* /usr/local \
    && rm -r /node-v4.4.3-linux-x64*  /nginx.key \
    && npm install pm2  -g \
    && echo "Asia/Shanghai" > /etc/timezone

COPY sshconfig  /etc/ssh/sshd_config
COPY start.sh /start.sh
RUN chmod 700 /start.sh

EXPOSE 443 80 22
CMD ["/bin/bash","-c","/start.sh"]
