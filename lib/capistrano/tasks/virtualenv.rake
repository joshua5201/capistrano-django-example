namespace :virtualenv do
    desc 'Install virtualenv'
    task :install do
        on roles(:app) do
            execute "virtualenv -p ~/.pyenv/versions/#{fetch(:python_version)}/bin/python #{File.join(shared_path, fetch(:virtualenv_path))}"
        end
    end
end
