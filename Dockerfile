ARG JDK
ARG JDK_DIR=${JDK}
FROM centos:centos7
LABEL maintainer="Cedar lvr@sunflyme.com"
WORKDIR /usr/local/jdk
ADD ${JDK}.tar.gz /usr/local/jdk/

# 复制宋体字体（路径相对于dockerfile的路径）
COPY simsun.ttc /usr/share/fonts/

RUN mkdir -p /usr/local/jdk/config
RUN yum install kde-l10n-Chinese -y
RUN yum install dejavu-sans-fonts fontconfig -y
RUN yum -y reinstall glibc-common
RUN localedef -c -f UTF-8 -i zh_CN C.utf8
RUN echo "LANG=C.UTF-8" > /etc/locale.conf

#配置java环境变量
ENV JAVA_HOME /usr/local/jdk/zulu8.58.0.13-ca-jdk8.0.312-linux_x64
ENV JRE_HOME $JAVA_HOME/jre
ENV CLASSPATH $JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar:$JRE_HOME/lib:$CLASSPATH
ENV PATH $JAVA_HOME/bin:$PATH
ENV LANG C.UTF-8
