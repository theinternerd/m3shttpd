#!/bin/bash
#################################################################
# htttpd wont start correctly if it thinks it is already running.
#  So, this little script will cleanup any lock files that may
#  still exist before starting the service
##########################################

rm -rf /run/httpd/* /tmp/httpd*
exec /usr/sbin/apachectl -DFOREGROUND
