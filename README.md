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

## Install

```bash
sudo apt update
```

### pipenv

```bash
pip install --user pipenv
```

### k3d

- [Install Doc](https://k3d.io/v4.4.8/#install-script)
- [DiskPressure issue](https://github.com/tilt-dev/tilt/issues/1076)

```bash
# install
curl -s https://raw.githubusercontent.com/rancher/k3d/main/install.sh | bash

# launch cluster: tilt-test-cluster
k3d cluster create tilt-test-cluster --k3s-server-arg '--kubelet-arg=eviction-hard=imagefs.available<1%,nodefs.available<1%' \
    --k3s-server-arg '--kubelet-arg=eviction-minimum-reclaim=imagefs.available=1%,nodefs.available=1%'
```

### kubectl

- [Install Doc](https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/#install-kubectl-binary-with-curl-on-linux)

```bash
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubectl
```

### Tilt

- [Install Doc](https://docs.tilt.dev/install.html#linux)

```bash
curl -fsSL https://raw.githubusercontent.com/tilt-dev/tilt/master/scripts/install.sh | bash
```

### K9s (Optional, but practical)

```bash
curl -sS https://webinstall.dev/k9s | bash
```

## Run

```bash
tilt up
```
