FROM centos:7

LABEL org.label-schema.name = "m3shttpd" org.label-schema.vendor = "Mark III Systems" org.label-schema.description = "This container runs an appache/httpd web server"	
LABEL org.label-schema.vcs-url = "https://github.com/theinternerd/m3shttpd" org.label-schema.version = "1.0"  
LABEL org.label-schema.usage= "https://github.com/theinternerd/m3shttpd/blob/master/README.md"

# ARG BUILD_DATE

# LABEL org.label-schema.build-date=$BUILD_DATE

RUN yum -y --setopt=tsflags=nodocs install httpd && \
    yum clean all

EXPOSE 80

# Simple startup script to avoid issues with container restart
ADD run-httpd.sh /run-httpd.sh
RUN chmod -v +x /run-httpd.sh

CMD ["/run-httpd.sh"]
