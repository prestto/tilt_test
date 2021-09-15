# Tilt Test

This repo is a test to deploy a simple `django` app in `Tilt`.  If the test is succesful, I'll use tilt for my next side project.

For the test to be succesful, tilt must be able to:

- Quickly reflect local changes to a docker container (ie not have to relaunch the container manually).

- Files created by running a script in the container must be available on host (mimicing django's makemigrations).

- We should be able to launch a script in the container from the host (for operations like seeding, reset DB etc).

Bonus:

- Tilt is compatable with pipenv

## Stack

- [django](https://github.com/django/django) It's more heavy-weight than flask/ bottle, but this means that we can test more functionality
- [k3d](https://k3d.io/v4.4.8/) A minimal kubernetes installation for running in local
- [Tilt...](https://tilt.dev/) obviously
