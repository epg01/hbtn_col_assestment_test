postgres:
	sudo docker run --name postgres12 -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret -d postgres:12-alpine

postgresdown:
	sudo docker stop postgres12; sudo docker rm postgres12

createdb:
	sudo docker exec -it postgres12 createdb --username=root --owner=root holberton

dropdb:
	sudo docker exec -it postgres12 dropdb holberton

schema:
	migrate create -ext sql -dir db/migration -seq init_schema

migrationup:
	migrate -path db/migration -database "postgresql://root:secret@localhost:5432/holberton?sslmode=disable" -verbose up

migrationdown:
	migrate -path db/migration -database "postgresql://root:secret@localhost:5432/holberton?sslmode=disable" -verbose down

sqlc:
	sqlc generate

gomod:
	go mod init github.com/SixTanDev/SimpleBank

gomodtidy:
	go mod tidy

.PHONY: postgres createdb dropdb schema migrationup migrationdown sqlc gomod gomodtidy