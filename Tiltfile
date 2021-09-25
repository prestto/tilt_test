# specify k8s config
k8s_yaml('./k8s/app.yml')

# run app
k8s_resource('example-python', port_forwards=8000,
             resource_deps=['deploy'])

print('Running Tiltfile')
docker_build('user632716/general:example-python-image', '.', dockerfile='./docker/Dockerfile', live_update=[
    sync('.', '/app'),
    run('cd /app && pip install -r requirements.txt', trigger='./requirements.txt'),

    # if all that changed was start-time.txt, make sure the server
    # reloads so that it will reflect the new startup time
    run('touch /app/app.py', trigger='./start-time.txt'),
])

print('Setting up test scripts')
test('unit_tests', 'pipenv run python manage.py test', deps=['./common/', './test'])
