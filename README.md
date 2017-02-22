### Extends docker image for postgres database used in events-deploy project.

Adds users table populated with user details.

Example usage:

`docker run --name events-postgres -e POSTGRES_USER=user -e POSTGRES_DB=events -e EVENTS_APP_USER=$EVENTS_APP_USER -e EVENTS_APP_PASSWORD=$EVENTS_APP_PASSWORD -p 5432:5432  db`
