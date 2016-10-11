namespace :migration do
    def load_virtualenv
        "source #{File.join(shared_path, fetch(:virtualenv_path))}/bin/activate"
    end

    desc "Run migration"
    task :run do
        on roles(:app) do
            execute "#{load_virtualenv} && python #{release_path}/manage.py migrate"
        end
    end
    after 'deploy:updated', 'migration:run'
end

