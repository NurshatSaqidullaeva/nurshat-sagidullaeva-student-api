# Nurshat Sagidullaeva - Student API

**Author:** Sagidullaeva Nurshat (Student ID 41536, group IT2-23.09)
**Description:** Fully documented Student REST API with a validated create endpoint (see the API endpoints section below).

## Tech stack
- Java 17, Spring Boot 3, Gradle
- PostgreSQL 16
- Docker, Docker Compose
- Jenkins (CI pipeline)

## Run with Docker Compose
1. Copy `.env.example` to `.env` and set the database password.
2. Start everything:
   ```bash
   docker compose up -d --build
   ```
3. The API is available at http://localhost:8080/api/students

## API endpoints
All endpoints use JSON. Base URL: `http://localhost:8080/api/students`.

Example - create a student:
```bash
curl -X POST http://localhost:8080/api/students \
  -H "Content-Type: application/json" \
  -d '{"fullName":"Nurshat Sagidullaeva","email":"nurshat@example.com","groupName":"IT2-23.09"}'
```

| Method | URL | Description |
|--------|-----|-------------|
| GET | /api/students | list all students |
| GET | /api/students/{id} | get one student |
| POST | /api/students | create a student |
| PUT | /api/students/{id} | update a student |
| DELETE | /api/students/{id} | delete a student |

## Change log
- Create endpoint now validates `fullName` (not blank) and `email` (valid format) and returns `201 Created`.
- Added automated tests for create and for a nonexistent student.
