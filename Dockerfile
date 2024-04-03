FROM amazoncorretto:21.0.1 as build
COPY . /usr/app
WORKDIR /usr/app
RUN chmod +x mvnw && ./mvnw clean package

FROM amazoncorretto:21.0.1-alpine3.18

#EXPOSE 8080
RUN mkdir /app
COPY --from=build /usr/app/target/*.jar /app.jar


ENTRYPOINT ["java", "-jar", "/app.jar"]
