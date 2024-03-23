FROM openjdk:17
EXPOSE 8080
ADD target/TravelApp.war /app/travelapp.war
CMD ["java","-jar","/app/travelapp.war"]