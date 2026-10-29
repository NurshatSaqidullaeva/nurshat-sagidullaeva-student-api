# ---------- Stage 1: build the JAR with Gradle (official Gradle + JDK 17 image) ----------
FROM gradle:8.10.2-jdk17 AS build
WORKDIR /home/gradle/src
COPY --chown=gradle:gradle build.gradle settings.gradle ./
COPY --chown=gradle:gradle src ./src
RUN gradle bootJar --no-daemon

# ---------- Stage 2: small runtime image with only a JRE ----------
FROM eclipse-temurin:17-jre
WORKDIR /app
COPY --from=build /home/gradle/src/build/libs/app.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
