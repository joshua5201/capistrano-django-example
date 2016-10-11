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

## Setting Ruby Environment

### Install Ruby

If you're not familiar with Ruby, you can follow steps from [Rails Bridge Installfest](http://docs.railsbridge.org/installfest/).

Just follow the steps until the Rails section (you don't need to install Rails).

### Install Packages

```bash
gem install bundler
bundle install
```

## How to Use

1. Edit configuration files in config/, change application names, application paths, python version
2. Create shared files and folders in target machine
3. run `cap staging/production pyenv:install`
4. run `cap staging/production virtualenv:install`
5. run `cap staging/production deploy`
6. Setting up your nginx config files (see nginx\_application.example)
