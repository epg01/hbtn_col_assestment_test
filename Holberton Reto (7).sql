CREATE TABLE "orders" (
  "id" bigserial,
  "name_id" bigserial,
  "id_unionop" bigserial,
  "total" float NOT NULL,
  "subtotal" float NOT NULL,
  "taxes" varchar NOT NULL,
  "paid" varchar NOT NULL,
  "created_at" timestamptz NOT NULL DEFAULT (now()),
  PRIMARY KEY ("id", "name_id", "id_unionop")
);

CREATE TABLE "users" (
  "id" bigserial PRIMARY KEY,
  "name" varchar NOT NULL,
  "last_name" varchar NOT NULL,
  "gob_id" varchar NOT NULL,
  "email" varchar NOT NULL,
  "company" varchar NOT NULL
);

CREATE TABLE "shippings" (
  "id" bigserial PRIMARY KEY,
  "address" varchar NOT NULL,
  "city" varchar NOT NULL,
  "state" varchar NOT NULL,
  "country" varchar NOT NULL,
  "cost" float NOT NULL
);

CREATE TABLE "payment" (
  "id" bigserial PRIMARY KEY,
  "type" varchar NOT NULL,
  "txn_id" varchar UNIQUE NOT NULL,
  "total" float NOT NULL,
  "created_at" timestamptz NOT NULL DEFAULT (now())
);

CREATE TABLE "unionOS" (
  "id_shipping" bigserial PRIMARY KEY
);

CREATE TABLE "unionOP" (
  "id_payment" bigserial PRIMARY KEY
);

ALTER TABLE "orders" ADD FOREIGN KEY ("id") REFERENCES "unionOS" ("id_shipping");

ALTER TABLE "orders" ADD FOREIGN KEY ("name_id") REFERENCES "users" ("id");

ALTER TABLE "orders" ADD FOREIGN KEY ("id_unionop") REFERENCES "unionOP" ("id_payment");

ALTER TABLE "shippings" ADD FOREIGN KEY ("id") REFERENCES "unionOS" ("id_shipping");

ALTER TABLE "payment" ADD FOREIGN KEY ("id") REFERENCES "unionOP" ("id_payment");

