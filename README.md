# Installing the app

## Building and running containers
```sh
docker-compose up
```

## Creating database
```sh
docker-compose run web rake db:create
```

## Creating the database schema
```sh
docker-compose run web rake db:migrate
```

# Todo APIs docs