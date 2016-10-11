namespace :assets do
    def load_virtualenv
        "source #{File.join(shared_path, fetch(:virtualenv_path))}/bin/activate"
    end

    desc "Precompile assets"
    task :precompile do
        on roles(:app) do
            execute "#{load_virtualenv} && python #{release_path}/manage.py compilestatic"
        end
    end

    desc "Collect assets"
    task :collect do
        on roles(:app) do
            execute "#{load_virtualenv} && python #{release_path}/manage.py collectstatic --noinput"
        end
    end

    after 'deploy:updated', 'assets:precompile'
    after 'deploy:updated', 'assets:collect'
end

