require 'json'
require 'fileutils'
#require 'rack-ssl-enforcer'

#use Rack::SslEnforcer unless ENV['RACK_ENV']=='test'
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
  erb :index
end

private

def debug_env
  puts `which ruby`
end
