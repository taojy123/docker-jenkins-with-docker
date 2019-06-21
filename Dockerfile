FROM jenkins/jenkins:lts


USER root


RUN echo "deb http://mirrors.163.com/debian/ stretch main non-free contrib" > /etc/apt/sources.list
RUN echo "deb http://mirrors.163.com/debian/ stretch-updates main non-free contrib" >> /etc/apt/sources.list
RUN echo "deb http://mirrors.163.com/debian/ stretch-backports main non-free contrib" >> /etc/apt/sources.list
RUN echo "deb-src http://mirrors.163.com/debian/ stretch main non-free contrib" >> /etc/apt/sources.list
RUN echo "deb-src http://mirrors.163.com/debian/ stretch-updates main non-free contrib" >> /etc/apt/sources.list
RUN echo "deb-src http://mirrors.163.com/debian/ stretch-backports main non-free contrib" >> /etc/apt/sources.list
RUN echo "deb http://mirrors.163.com/debian-security/ stretch/updates main non-free contrib" >> /etc/apt/sources.list
RUN echo "deb-src http://mirrors.163.com/debian-security/ stretch/updates main non-free contrib" >> /etc/apt/sources.list


# ============== 脚本一键安装 ==============
RUN curl -fsSL get.docker.com -o get-docker.sh
RUN sh get-docker.sh --mirror Aliyun
# RUN curl -sSL https://get.docker.com | sh


# ================ 手动安装 ================ 
# RUN apt-get update
# RUN apt-get install -y apt-transport-https ca-certificates curl gnupg2 lsb-release software-properties-common


# # 国内源
# RUN curl -fsSL https://mirrors.aliyun.com/docker-ce/linux/debian/gpg | apt-key add -
# RUN add-apt-repository "deb [arch=amd64] https://mirrors.aliyun.com/docker-ce/linux/debian $(lsb_release -cs) stable"

# # 官方源
# # RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
# # RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"


# RUN apt-get update
# RUN apt-get install -y docker-ce


RUN sed -i '1 a\\nnohup dockerd &\n' /usr/local/bin/jenkins.sh


LABEL name="jenkins-with-docker"
LABEL baseos="Debian 9 Stretch"
LABEL startup="docker run --name jenkins -d -p 8080:8080 -p 50000:50000 -v /var/jenkins_home:/var/jenkins_home --privileged taojy123/jenkins-with-docker"
