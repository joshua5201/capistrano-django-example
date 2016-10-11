namespace :pyenv do
    desc 'Install pyenv'
    task :install do
        on roles(:app) do
            execute 'curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash'
            execute "~/.pyenv/bin/pyenv install #{fetch(:python_version)}"
        end
    end
end
