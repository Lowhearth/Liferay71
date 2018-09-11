FROM anapsix/alpine-java:8u181b13_jdk

RUN  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV LIFERAY_HOME=/liferay
ENV LIFERAY_SHARED=/storage/liferay
ENV LIFERAY_CONFIG_DIR=/tmp/liferay/configs
ENV LIFERAY_DEPLOY_DIR=/tmp/liferay/deploy
ENV CATALINA_HOME=$LIFERAY_HOME/tomcat-9.0.6
ENV PATH=$CATALINA_HOME/bin:$PATH
ENV LIFERAY_TOMCAT_URL=https://sourceforge.net/projects/lportal/files/Liferay%20Portal/7.1.0%20GA1/liferay-ce-portal-tomcat-7.1.0-ga1-20180703012531655.zip/download

WORKDIR $LIFERAY_HOME

RUN mkdir -p "$LIFERAY_HOME" \
      && wget "$LIFERAY_TOMCAT_URL" -O /tmp/liferay-ce-portal-tomcat.zip \
      && mkdir /tmp/liferay \
      && unzip /tmp/liferay-ce-portal-tomcat.zip -d /tmp/liferay \
      && mv /tmp/liferay/liferay-ce-portal-7.1.0-ga1/* $LIFERAY_HOME/ \
      && rm /tmp/liferay-ce-portal-tomcat.zip


EXPOSE 8080/tcp

VOLUME /storage

ENTRYPOINT ["/bin/ash"]
CMD ["/liferay/tomcat-9.0.6/bin/catalina.sh", "run"]
