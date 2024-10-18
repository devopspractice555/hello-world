# Pull base image 
FROM tomcat:8-jre8 

COPY ./*.war /usr/local/tomcat/webapps/
# Expose the port on which Tomcat runs
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
