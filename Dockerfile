FROM openjdk:17
EXPOSE 8080
ADD target/TravelApp.war travelapp.war
CMD ["java","-jar","/travelapp.war"]
