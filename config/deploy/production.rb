# Simple Role Syntax
# ==================
# Supports bulk-adding hosts to roles, the primary
# server in each group is considered to be the first
# unless any hosts have the primary property set.
# Don't declare `role :all`, it's a meta role
role :app, %w{deploy@ec2-54-187-116-152.us-west-2.compute.amazonaws.com}
role :web, %w{deploy@ec2-54-187-116-152.us-west-2.compute.amazonaws.com}
role :db,  %w{deploy@ec2-54-187-116-152.us-west-2.compute.amazonaws.com}
role :resque_worker, %w{deploy@ec2-54-187-116-152.us-west-2.compute.amazonaws.com}
role :resque_scheduler, %w{deploy@ec2-54-187-116-152.us-west-2.compute.amazonaws.com}

set :workers, { "*" => 1 }
set :resque_environment_task, true

# Extended Server Syntax
# ======================
# This can be used to drop a more detailed server
# definition into the server list. The second argument
# something that quacks like a hash can be used to set
# extended properties on the server.
server 'ec2-54-187-116-152.us-west-2.compute.amazonaws.com', user: 'deploy', roles: %w{web app}, my_property: :my_value

# you can set custom ssh options
# it's possible to pass any option but you need to keep in mind that net/ssh understand limited list of options
# you can see them in [net/ssh documentation](http://net-ssh.github.io/net-ssh/classes/Net/SSH.html#method-c-start)
# set it globally
#  set :ssh_options, {
#    keys: %w(/home/rlisowski/.ssh/id_rsa),
#    forward_agent: false,
#    auth_methods: %w(password)
#  }
# and/or per server
server 'ec2-54-187-116-152.us-west-2.compute.amazonaws.com',
  user: 'ubuntu',
  roles: %w{web app},
  ssh_options: {
    keys: %w(/Users/blakejohnson/.ssh/potavida.pem),
    forward_agent: false,
    auth_methods: %w(publickey)
    # password: 'please use keys'
  }
# setting per server overrides global ssh_options


namespace :figaro do
  desc "SCP transfer figaro configuration to the shared folder"
  task :setup do
    on roles(:app) do
      upload! "config/application.yml", "#{shared_path}/application.yml", via: :scp
    end
  end
 
  desc "Symlink application.yml to the release path"
  task :symlink do
    on roles(:app) do
      execute "ln -sf #{shared_path}/application.yml #{current_path}/config/application.yml"
    end
  end
end

after "deploy:started", "figaro:setup"
after "deploy:symlink:release", "figaro:symlink"
after "deploy:restart", "resque:restart"


