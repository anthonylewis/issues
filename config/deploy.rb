
set :application, "issues"
set :user, 'tony'

set :deploy_to, "/home/tony/issues"

set :scm, :git
set :repository,  "git@github.com:anthonylewis/issues.git"

default_run_options[:pty] = true
set :deploy_via, :remote_cache

set :branch, 'master'
set :scm_verbose, true
set :use_sudo, false

role :web, "50.56.107.232"
role :app, "50.56.107.232"
role :db,  "50.56.107.232", :primary => true

# this makes RVM work even when deploying from Windows
set :default_environment, {
  'PATH' => "/home/tony/.rvm/gems/ruby-1.9.2-p180@railsclass/bin:/home/tony/.rvm/gems/ruby-1.9.2-p180@global/bin:/home/tony/.rvm/rubies/ruby-1.9.2-p180/bin:/home/tony/.rvm/bin:$PATH",
  'RUBY_VERSION' => 'ruby-1.9.2-p180',
  'GEM_HOME' => '/home/tony/.rvm/gems/ruby-1.9.2-p180@railsclass',
  'GEM_PATH' => '/home/tony/.rvm/gems/ruby-1.9.2-p180@railsclass:/home/tony/.rvm/gems/ruby-1.9.2-p180@global',
}

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

# automatically trust .rvmrc
namespace :rvm do
  desc 'Trust rvmrc file'
  task :trust_rvmrc do
    run "rvm rvmrc trust #{current_release}"
  end
end
 
after "deploy:update_code", "rvm:trust_rvmrc"

