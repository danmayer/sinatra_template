# encoding: UTF-8
require 'json'
require 'fileutils'
require 'sinatra/flash'
require 'airbrake'
#require 'rack-ssl-enforcer'

require './lib/rack_catcher'

#use Rack::SslEnforcer unless ENV['RACK_ENV']=='test'
set :public_folder, File.dirname(__FILE__) + '/public'
set :root, File.dirname(__FILE__)
enable :logging
enable :sessions

configure :development do
  require "better_errors"
  use BetterErrors::Middleware
  BetterErrors.application_root = File.dirname(__FILE__)
end

configure :production do
  Airbrake.configure do |config|
    config.api_key = ENV['ERRBIT_API_KEY']
    config.host    = ENV['ERRBIT_HOST']
    config.port    = 80
    config.secure  = config.port == 443
  end
  use Airbrake::Rack
  set :raise_errors, true
  use Rack::Catcher
end

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
  flash[:notice] = "your up and running"
  erb :index
end

get '/error' do
  raise 'example error'
end

private

def debug_env
  puts `which ruby`
end
