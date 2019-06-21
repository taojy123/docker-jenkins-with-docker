FROM jenkins/jenkins:lts


# RUN echo "deb http://mirrors.163.com/debian/ stretch main non-free contrib" > /etc/apt/sources.list
# RUN echo "deb http://mirrors.163.com/debian/ stretch-updates main non-free contrib" | tee -a /etc/apt/sources.list
# RUN echo "deb http://mirrors.163.com/debian/ stretch-backports main non-free contrib" | tee -a /etc/apt/sources.list
# RUN echo "deb-src http://mirrors.163.com/debian/ stretch main non-free contrib" | tee -a /etc/apt/sources.list
# RUN echo "deb-src http://mirrors.163.com/debian/ stretch-updates main non-free contrib" | tee -a /etc/apt/sources.list
# RUN echo "deb-src http://mirrors.163.com/debian/ stretch-backports main non-free contrib" | tee -a /etc/apt/sources.list
# RUN echo "deb http://mirrors.163.com/debian-security/ stretch/updates main non-free contrib" | tee -a /etc/apt/sources.list
# RUN echo "deb-src http://mirrors.163.com/debian-security/ stretch/updates main non-free contrib" | tee -a /etc/apt/sources.list

# RUN curl -sSL https://get.docker.com | sh

RUN curl -sSL https://get.daocloud.io/docker | sh

RUN sed -i '1 a\\nnohup dockerd &\n' /usr/local/bin/jenkins.sh

# USER root

# ENTRYPOINT ["/sbin/tini", "--", "/usr/local/bin/jenkins.sh"]

