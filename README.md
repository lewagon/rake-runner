# Le Wagon Rake Runner Docker image

This is the base image to be used by **Project Glovebox**—a secure code runner to test student exercises that belong to `fullstack-challenges` program (accessible to Le Wagon bootcamp students and teachers only).

It contains all Ruby (and soon JS) dependencies requires to `rake` exercices and will give the output to `stdout` if run either through `RakeDockerRunner` class that uses [docker-api](https://github.com/swipely/docker-api) gem to talk to Docker daemon through API), or directly with Docker CLI.

## Running locally with Docker CLI

Make sure Docker daemon is [installed](https://www.docker.com/products/docker-desktop) and running on your local machine.

```sh
# Pull the latest image and store it locally
$ docker pull progapandist/rake-runner:latest

# For convenience, set an ENV variable with full qualified path to
# exercise folder that MUST contain a Rakefile and .rubocop.yml
$ EXERCISE_PATH=/Users/andybarnov/code/progapandist/fullstack-challenges/02-OOP/02-OO-Advanced/02-Dessert-inheritance

# Run the image by bind-mounting the exercise folder into the container
$ docker run -t -v $EXERCISE_PATH:/ex progapandist/rake-runner:latest
```

## Overriding entrypoint for debugging

If you want to debug a running container, you can override the entrypoint at runtime by logging directly into shell.

```sh
# This will run the shell, with /ex as `pwd` and student code already mounted
$ docker run -it --entrypoint "bash" -v /Users/andybarnov/code/progapandist/fullstack-challenges/02-OOP/02-OO-Advanced/02-Dessert-inheritance:/ex progapandist/rake-runner:latest

# Without a mount
$ docker run -it --entrypoint "bash" progapandist/rake-runner:latest

# Once in a container shell, you can verify that you are indeed running a Debian flavor of Linux by running
$ cat /etc/*-release
```

## Automated builds

This repository is connected to [progapandist/rake-runner](https://hub.docker.com/r/progapandist/rake-runner) repository on Docker Hub and every change in master will automatically trigger build on Docker's infrastructure.
