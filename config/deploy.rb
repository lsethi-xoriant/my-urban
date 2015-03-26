set :application, "myurban.com.ua"
set :domain, "deploy@mhttp://178.62.246.19/"
set :deploy_to, "/home/deploy/#{application}"
set :use_sudo, false
set :unicorn_conf, "#{deploy_to}/current/config/unicorn.rb"
set :unicorn_pid, "#{deploy_to}/shared/pids/unicorn.pid"

set :rvm_ruby_string, 'ree'

set :scm, :git
set :repository,  "https://github.com/coaxsoft/my-urban"
set :branch, "dev"
set :deploy_via, :remote_cache

role :web, domain
role :app, domain
role :db,  domain, :primary => true

set :keep_releases, 5

after "deploy", "deploy:cleanup" # keep only the last 5 releases

set :shared_children, shared_children + %w{public/uploads}

namespace :carrierwave do
  task :symlink, roles: :app do
    run "ln -nfs #{shared_path}/public/uploads/ #{release_path}/public/uploads"
  end
  after "deploy:finalize_update", "carrierwave:symlink"
end


namespace :deploy do
  task :restart do
    run "if [ -f #{unicorn_pid} ] && [ -e /proc/$(cat #{unicorn_pid}) ]; then kill -USR2 `cat #{unicorn_pid}`; else cd #{deploy_to}/current && bundle exec unicorn_rails -E production -c #{unicorn_conf} -D; fi"
  end
  task :start do
    run "cd #{deploy_to}/current/ && bundle exec unicorn_rails -E production -c #{unicorn_conf} -D"
  end
  task :stop do
    run "if [ -f #{unicorn_pid} ] && [ -e /proc/$(cat #{unicorn_pid}) ]; then kill -QUIT `cat #{unicorn_pid}`; fi"
  end
end
