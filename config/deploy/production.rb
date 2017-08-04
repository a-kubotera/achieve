server '54.65.143.22', user: 'app', roles: %w{app db web}
set :ssh_options, keys: '/Users/akira/.ssh/id_rsa'
