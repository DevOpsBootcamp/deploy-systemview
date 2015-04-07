default['systemview']['app_path'] = '/opt/systemview'
default['systemview']['virtualenv_path'] = '/opt/systemview_venv'

default['systemview']['repository'] = 'https://github.com/DevOpsBootcamp/systemview'
default['systemview']['revision'] = 'master'
default['systemview']['gunicorn_port'] =  8000

default['systemview']['server_name'] = node['fqdn']
