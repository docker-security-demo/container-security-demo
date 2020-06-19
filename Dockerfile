FROM openjdk:latest AS Build
USER root
ADD build/libs/demo-0.0.1-SNAPSHOT.jar demo.jar
CMD ["java", "-jar", "demo.jar"]

FROM Build AS Scan
ADD https://get.aquasec.com/microscanner /
RUN chmod +x /microscanner
ARG token
RUN /microscanner ${token}
RUN echo "No vulnerabilities!"