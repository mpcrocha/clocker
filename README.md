# README

Create the local database
```docker run --name clocker_db -e POSTGRES_USER=clocker -e POSTGRES_DB=clocker -e POSTGRES_PASSWORD='clocker!23' -d -p 5451:5432 postgres```
