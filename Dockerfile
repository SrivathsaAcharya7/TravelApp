FROM openjdk:17
EXPOSE 8080
ADD target/TravelApp.jar travelapp.jar
ENTRYPOINT ["java","-jar","/travelapp.jar"]