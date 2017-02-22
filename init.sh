#!/bin/bash

psql -v ON_ERROR_STOP=1 -U "$POSTGRES_USER" -d "$POSTGRES_DB" <<-EOSQL
    CREATE TABLE users(
        id          BIGSERIAL PRIMARY KEY,
        username    VARCHAR NOT NULL,
        password    VARCHAR NOT NULL,
        permissions VARCHAR
    );
    INSERT INTO users(username, password) values('$EVENTS_APP_USER', '$EVENTS_APP_PASSWORD');
EOSQL
