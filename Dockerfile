FROM openjdk:8
ADD target/*.jar biom.jar
EXPOSE 8084
CMD java -jar biom.jar
