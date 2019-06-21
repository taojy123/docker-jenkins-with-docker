FROM jenkins/jenkins:lts

LABEL BaseOS="Debian 9 Stretch"

USER root


RUN echo "deb http://mirrors.163.com/debian/ stretch main non-free contrib" > /etc/apt/sources.list
RUN echo "deb http://mirrors.163.com/debian/ stretch-updates main non-free contrib" >> /etc/apt/sources.list
RUN echo "deb http://mirrors.163.com/debian/ stretch-backports main non-free contrib" >> /etc/apt/sources.list
RUN echo "deb-src http://mirrors.163.com/debian/ stretch main non-free contrib" >> /etc/apt/sources.list
RUN echo "deb-src http://mirrors.163.com/debian/ stretch-updates main non-free contrib" >> /etc/apt/sources.list
RUN echo "deb-src http://mirrors.163.com/debian/ stretch-backports main non-free contrib" >> /etc/apt/sources.list
RUN echo "deb http://mirrors.163.com/debian-security/ stretch/updates main non-free contrib" >> /etc/apt/sources.list
RUN echo "deb-src http://mirrors.163.com/debian-security/ stretch/updates main non-free contrib" >> /etc/apt/sources.list


# 无法傻瓜式安装
# RUN curl -fsSL get.docker.com -o get-docker.sh
# RUN sh get-docker.sh --mirror Aliyun
# RUN curl -sSL https://get.docker.com | sh


RUN apt-get update
RUN apt-get install -y apt-transport-https ca-certificates curl gnupg2 lsb-release software-properties-common


# 官方源
# RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
# RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"


# 国内源
RUN curl -fsSL https://mirrors.aliyun.com/docker-ce/linux/debian/gpg | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://mirrors.aliyun.com/docker-ce/linux/debian $(lsb_release -cs) stable"


RUN apt-get update
RUN apt-get install -y docker-ce


RUN usermod -aG docker jenkins


RUN sed -i '1 a\\systemctl enable docker\nsystemctl start docker\n' /usr/local/bin/jenkins.sh


USER jenkins


# ENTRYPOINT ["/sbin/tini", "--", "/usr/local/bin/jenkins.sh"]

