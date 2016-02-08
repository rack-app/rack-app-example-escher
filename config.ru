require 'bundler'
Bundler.require
Loader.autoload
require './credential'

class User

  def self.find(id)
    {}
  end

  def self.all
    []
  end

end

class YourAwesomeApp < Rack::App

  get '/whoami' do
    request.env['request.api_key_id']
  end


  get '/users' do
    JSON.dump(User.all)
  end

  get 'users/:user_id' do
    JSON.dump(User.find(params['user_id']))
  end

end

require 'escher/rack_middleware'

Escher::RackMiddleware.config do |c|
  c.add_escher_authenticator { Escher::Auth.new(Credential::Scope, Credential::AuthOptions) }
  c.add_credential_updater { Escher::Keypool.new.get_key_db }
end

use Escher::RackMiddleware

run YourAwesomeApp