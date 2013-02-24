ENV['RACK_ENV'] = 'test'
require 'sinatra'
require 'app'
require 'test/unit'
require 'rack/test'
require 'mocha/setup'

class MyAppTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_root
    get '/'
    assert_match 'Welcome', last_response.body
  end

  private

  def script_payload
    {:fake => 'payload'}
  end

end
