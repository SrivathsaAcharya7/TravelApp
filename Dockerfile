FROM openjdk:17
ADD target/TravelApp.jar travelapp.jar
ENTRYPOINT ["java","-jar","/travelapp.jar"]