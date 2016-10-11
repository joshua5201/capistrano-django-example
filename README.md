# capistrano-django-example

My capistrano deploy scripts for django, pyenv, pip and uwsgi.

## About
Including the configuration of:

1. pyenv
2. virtualenv
3. pip
4. assets (compile, collect)
5. migration
6. uwsgi config and process management

## How to use

1. Edit configuration files in config/, change application names, application paths, python version
2. Create shared files and folders in target machine
3. run `cap -T staging/production pyenv:install`
4. run `cap -T staging/production virtualenv:install`
5. run `cap -T staging/production deploy`
6. Setting up your nginx config files (see nginx\_application.example)
