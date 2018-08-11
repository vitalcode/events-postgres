#!/bin/bash

psql -v ON_ERROR_STOP=1 -U "$POSTGRES_USER" -d "$POSTGRES_DB" <<-EOSQL
    CREATE TABLE "user" (
      "id"          BIGSERIAL PRIMARY KEY,
      "uid"         VARCHAR NOT NULL UNIQUE,
      "name"        VARCHAR NOT NULL UNIQUE,
      "email"       VARCHAR NOT NULL UNIQUE,
      "password"    VARCHAR NOT NULL,
      "status"      VARCHAR NOT NULL,
      "vat"         VARCHAR,
      "permissions" VARCHAR
    );
    INSERT INTO "user"("uid", "name", "email", "password", "status", "permissions")
        values('dbe90976-6ead-4678-870a-c4579b0cb91b', '$EVENTS_APP_USER', '$EVENTS_APP_USER', '$EVENTS_APP_PASSWORD', 'Active', 'admin');
EOSQL
