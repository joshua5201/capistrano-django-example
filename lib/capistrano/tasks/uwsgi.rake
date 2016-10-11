namespace :uwsgi do
    def load_virtualenv
        "source #{File.join(shared_path, fetch(:virtualenv_path))}/bin/activate"
    end

    def pid_path
        "#{shared_path}/uwsgi/pid"
    end

    def config_path
        "#{release_path}/config"
    end

    def uwsgi_path
        "#{shared_path}/uwsgi"
    end

    desc "Check shared folder"
    task :check do
        on roles(:app) do
            execute "mkdir -p #{shared_path}/uwsgi"
        end
    end
    before 'deploy:symlink:shared', :check

    desc "Start uwsgi"
    task :start do
        on roles(:app) do
            execute "#{load_virtualenv} && uwsgi --ini #{config_path}/uwsgi_default.ini --ini #{config_path}/uwsgi_#{fetch(:stage)}.ini --daemonize #{uwsgi_path}/log"
        end
    end
    after 'deploy:finished', 'uwsgi:reload'

    desc "Stop uwsgi"
    task :stop do
        on roles(:app) do
            execute "#{load_virtualenv} && uwsgi --stop #{pid_path}"
        end
    end

    desc "Reload uwsgi"
    task :reload do
        on roles(:app) do
            execute "#{load_virtualenv} && uwsgi --reload #{pid_path}"
        end
    end
end

