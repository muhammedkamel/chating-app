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

# Consume the API
> You can import the API in postman using this [link](https://www.getpostman.com/collections/a74866d57b83f6fe9c83) `https://www.getpostman.com/collections/a74866d57b83f6fe9c83`