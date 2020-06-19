FROM adoptopenjdk:11-jre-openj9 AS Build
RUN groupadd -r xconf && useradd -r -g xconf xconf
USER xconf
COPY build/libs/demo-0.0.1-SNAPSHOT.jar demo.jar
CMD ["java", "-jar", "demo.jar"]