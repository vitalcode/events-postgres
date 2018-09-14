#!/bin/bash

psql -v ON_ERROR_STOP=1 -U "$POSTGRES_USER" -d "$POSTGRES_DB" <<-EOSQL
    CREATE TABLE "user" (
      "id"                  BIGSERIAL PRIMARY KEY,
      "uid"                 VARCHAR NOT NULL UNIQUE,
      "email"               VARCHAR NOT NULL UNIQUE,
      "name"                VARCHAR NOT NULL,
      "password"            VARCHAR NOT NULL,
      "status"              VARCHAR NOT NULL,
      "agent"               BOOLEAN NOT NULL,
      "vat"                 VARCHAR,
      "permissions"         VARCHAR,
      "hmrc_access_token"   VARCHAR,
      "hmrc_token_type"     VARCHAR,
      "hmrc_expires_in"     VARCHAR,
      "hmrc_refresh_token"  VARCHAR,
      "hmrc_scope"          VARCHAR
    );
    INSERT INTO "user"("uid", "email", "name", "password", "status", "agent", "permissions")
        values('dbe90976-6ead-4678-870a-c4579b0cb91b', '$EVENTS_APP_USER', '$EVENTS_APP_USER', '$EVENTS_APP_PASSWORD', 'Active', FALSE, 'admin');
EOSQL

