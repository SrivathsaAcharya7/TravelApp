FROM openjdk:17
ADD target/TravelApp.jar TravelApp.jar
ENTRYPOINT ["java","-jar","/TravelApp.jar"]