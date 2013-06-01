ENV['RACK_ENV'] = 'test'
require 'sinatra'
require File.expand_path(File.join(File.dirname(__FILE__), '../app'))
require 'test/unit'
require 'rack/test'
require 'mocha/setup'
require File.expand_path(File.join(File.dirname(__FILE__), '../models/version'))
require 'webmock/test_unit'
require 'client'

class MyAppTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_root
    get '/'
    expected = {'status' => 'ok'}
    assert_equal expected, JSON.parse(last_response.body)
  end

  def test_create
    post 'create', script_payload
    expected = {"status"=>"ok", "message"=>"created payload"}
    assert_equal expected, JSON.parse(last_response.body)
  end
  
  def test_client_root
    setup_test_client
    expected = {'status' => 'ok'}
    assert_equal expected, Client::ApiClient.fetch_root
  end

  private

  def setup_test_client
    stub_request(:any, /www.example.com/).to_rack(app)
  end

  def script_payload
    {:message => 'payload'}
  end

  

end
