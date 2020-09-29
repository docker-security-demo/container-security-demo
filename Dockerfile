FROM adoptopenjdk:11-jre-openj9
RUN groupadd -r infrawebconf && useradd -r -g infrawebconf infrawebconf
USER infrawebconf
COPY build/libs/demo-0.0.1-SNAPSHOT.jar demo.jar
CMD ["java", "-jar", "demo.jar"]