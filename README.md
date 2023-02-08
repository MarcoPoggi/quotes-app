## Development Setup

#### Dependencies  
- Docker & Docker compose

#### Enviroment Variables(.env file)
```bash
RAILS_ENV=development

DATABASE_HOST=db
DATABASE_NAME=quotes
POSTGRES_USER=postgres
POSTGRES_PASSWORD=root

REDIS_URL=redis://redis:6379/1
```

#### Run the first time only
```bash
docker compose build
docker compose run app bundle install
docker compose run app rake db:drop db:create db:migrate db:seed # OR rails db:reset
docker compose up
```

#### The rest of the time just only need run
```bash
  docker compose up #🪄🐋
```