FROM tomcat:8.5.47-jdk8
MAINTAINER "Maintainer Name <xyz@uni-mainz.de>"
EXPOSE 8008
RUN rm -fr /usr/local/tomcat/webapps/*    # remove preinstalled webapps and manager
RUN useradd -u 501 -m -g root tomcat && chown -R tomcat:root /usr/local/tomcat    # Create a non-priviledged user to run Tomcat
ADD --chown=tomcat:root target/weka_rs.war /usr/local/tomcat/webapps/ROOT.war    # add the application war file
USER 501    # run as new user
