FROM openjdk:17
EXPOSE 8080
ADD target/TravelApp.war /app/travelapp.war
CMD ["java","-jar","/app/travelapp.war"]



# Use an appropriate base image that includes Java and a servlet container like Tomcat or Jetty
FROM tomcat:latest
EXPOSE 8080
# Copy your WAR file into the webapps directory of Tomcat
COPY target/TravelApp.war /usr/local/tomcat/webapps/
