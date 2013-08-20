# encoding: UTF-8
require 'json'
require 'fileutils'
require 'sinatra/flash'
#require 'rack-ssl-enforcer'
require "better_errors"

#use Rack::SslEnforcer unless ENV['RACK_ENV']=='test'
set :public_folder, File.dirname(__FILE__) + '/public'
set :root, File.dirname(__FILE__)
enable :logging
enable :sessions

configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.dirname(__FILE__)
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
