print('Running Tiltfile')
docker_build('user632716/general:example-python-image', '.',  dockerfile='./docker/Dockerfile')
k8s_yaml('./k8s/app.yml')
k8s_resource('example-python', port_forwards=8000)
