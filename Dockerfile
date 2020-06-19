FROM openjdk:11 AS Build
RUN groupadd -r xconf && useradd -r -g xconf xconf
USER xconf
ADD build/libs/demo-0.0.1-SNAPSHOT.jar demo.jar
CMD ["java", "-jar", "demo.jar"]