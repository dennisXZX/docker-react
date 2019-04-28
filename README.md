This project was bootstrapped with [Create React App](https://github.com/facebook/create-react-app).

This app is containerised using Docker.

Use `docker build -f Dockerfile.dev -t dennisxiao/react-frontend-dev .` to build an image for development.

Use `docker build .` to build an image for production. Create a container by `docker run -p 8080:80 IMAGE_ID`.

### How to sync the code in development

__Solution 1__

You can use docker command to achieve the code sync.

Use `docker run -p 3000:3000 -v /app/node_modules -v $(pwd):/app dennisxiao/react-frontend` to run a container

`-v $(pwd):/app` specify every time the container accesses the /app directory, it should reach back out to the current working directory on the local machine

`-v /app/node_modules` specify to bookmark the '/app/node_modules' folder

__Solution 2__

You can also use `volumes` in docker-compose to achieve the code sync.

```
volumes:
  # don't map the node_modules folder
  - /app/node_modules
  # map the current folder outside the container to the app folder inside container
  - .:/app
```