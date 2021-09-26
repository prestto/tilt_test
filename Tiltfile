# specify k8s config
k8s_yaml('./k8s/app.yml')

# run app
k8s_resource('example-python', port_forwards=8000)

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

print('Setting up makemigrations command')
local_resource(
    'make_migrations',
    cmd='pipenv run python manage.py makemigrations common',
    deps=['./common/', './test'],
    trigger_mode=TRIGGER_MODE_MANUAL
)

local_resource(
    'migrate',
    cmd='pipenv run python manage.py migrate common',
    deps=['./common/'],
    trigger_mode=TRIGGER_MODE_MANUAL
)
