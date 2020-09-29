FROM postgres:13.0-alpine AS Build
RUN addgroup infrawebconf && adduser -G infrawebconf -D infrawebconf
USER infrawebconf
COPY build/libs/demo-0.0.1-SNAPSHOT.jar demo.jar
CMD ["java", "-jar", "demo.jar"]