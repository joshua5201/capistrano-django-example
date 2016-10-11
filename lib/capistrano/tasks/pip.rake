namespace :pip do
    def load_virtualenv
        "source #{File.join(shared_path, fetch(:virtualenv_path))}/bin/activate"
    end

    desc "Install requirements with pip"
    task :requirements do
        on roles(:app) do
            execute "#{load_virtualenv} && pip install -r #{release_path}/#{fetch(:requirements_file)}"
        end
    end
    task :fix_attribute_error do
        on roles(:app) do
            execute "#{load_virtualenv} && pip install --upgrade setuptools pip"
        end
    end
    before 'deploy:updated', 'pip:requirements'
end

