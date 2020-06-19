FROM openjdk:latest AS Build
USER root
ADD build/libs/demo-0.0.1-SNAPSHOT.jar demo.jar
CMD ["java", "-jar", "demo.jar"]

#FROM Build AS Scan
#RUN apt-get update && apt-get -y install ca-certificates
#ADD https://get.aquasec.com/microscanner /
#RUN chmod +x /microscanner
#ARG token
#RUN /microscanner ${token}
#RUN echo "No vulnerabilities!"

RUN apk add --no-cache ca-certificates && update-ca-certificates && \
    wget -O /microscanner https://get.aquasec.com/microscanner && \
    chmod +x /microscanner && \
    /microscanner ${token} && \
    rm -rf /microscanner