This project was bootstrapped using [Create React App](https://github.com/facebook/create-react-app), then it is ejected on purpose to avoid hanging after running `yarn test`.

This app is containerised using Docker.

### For Development

Pull your code from source control then run `docker-compose up`.

If you prefer not relying on `docker-compose`, you can build an image and create a container manually as follows.

Use `docker build -f Dockerfile.dev -t dennisxiao/docker-react-dev .` to build an image for development.

Create a container by `docker container run -p 3000:3000 IMAGE_ID`.

#### How to sync the code in development

__Solution 1__

You can use docker command to achieve the code sync.

Use `docker container run -p 3000:3000 -v /app/node_modules -v $(pwd):/app IMAGE_ID` to run a container

`-v $(pwd):/app` specify every time the container accesses the /app directory, it should reach back out to the current working directory on the local machine

`-v /app/node_modules` specify to bookmark the '/app/node_modules' folder

__Solution 2__

You can also use `volumes` in docker-compose to achieve the code sync.

```
volumes:
  # don't map the node_modules folder
  # because this folder doesn't exist in the local environment
  - /app/node_modules
  
  # map the current folder outside the container to the app folder inside container
  - .:/app
```

### For Production

Use `docker build .` to build an image for production.

Create a container by `docker container run -p 8080:80 IMAGE_ID`.