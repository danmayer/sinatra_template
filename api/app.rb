require 'json'
require 'fileutils'
require File.expand_path(File.join(File.dirname(__FILE__), './models/version'))
require 'rack-ssl-enforcer'

use Rack::SslEnforcer unless ENV['RACK_ENV']=='test'
set :public_folder, File.dirname(__FILE__) + '/public'
set :root, File.dirname(__FILE__)
enable :logging

helpers do
  def protected!
    unless authorized?
      response['WWW-Authenticate'] = %(Basic realm="Testing HTTP Auth")
      throw(:halt, [401, "Not authorized\n"])
    end
  end

  def authorized?
    @auth ||=  Rack::Auth::Basic::Request.new(request.env)
    @auth.provided? && @auth.basic? && @auth.credentials && @auth.credentials == ['admin', 'responder']
  end
end

#before { protected! if request.path_info == "/" && request.request_method == "GET" && ENV['RACK_ENV']!='test' }

get '/' do
  {status: 'ok'}.to_json
end

post '/create' do
  {status: 'ok', message: "created #{params['message']}"}.to_json
end

get '/version' do
  {:version => App::VERSION}.to_json
end

private

def debug_env
  puts `which ruby`
end
