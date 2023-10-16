FROM ubuntu:latest AS build 

RUN apt-get update
RUN apt-get install openjdk-17-jdk -v

COPY . .

RUN apt-get istall maven -y
RUN mvn clean install

EXPOSE 8080

COPY --from=build/target/todolist-1.0.0.jar todolist app.jar

ENTRYPOINT [ "java", "-jar", "app.jar"]