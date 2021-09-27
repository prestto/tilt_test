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
local_resource(
    'unit_tests',
    cmd='./run.sh unit',
    deps=['./common/', './test', './scripts'],
    trigger_mode=TRIGGER_MODE_MANUAL
)

print('Setting up makemigrations command')
local_resource(
    'make_migrations',
    cmd='./run.sh makemigrations',
    deps=['./common/', './test', './scripts'],
    trigger_mode=TRIGGER_MODE_MANUAL
)

print('Setting up migrate command')
local_resource(
    'migrate',
    cmd='./run.sh migrate',
    deps=['./common/', './scripts'],
    trigger_mode=TRIGGER_MODE_MANUAL
)
