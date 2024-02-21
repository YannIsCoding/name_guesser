ENV['APP_ENV'] = 'test'

require 'app'
require 'test/unit'
require 'rack/test'

class AppTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app = Sinatra::Application

  test 'with a known name and standard ascii charactere, return a guess' do
    get '/', :name => 'Martin'

    assert last_response.ok?
    actual = JSON.parse(last_response.body)
    assert_equal ['DE'], actual['guessed_country']
    assert_equal 'Martin', actual['requested_name']
    refute_nil actual['time_processed']
  end

  test 'with a known name and non-standard ascii charactere' do
    get '/', :name => 'Müller'

    assert last_response.ok?
    actual = JSON.parse(last_response.body)
    assert_equal ['DE'], actual['guessed_country']
    assert_equal 'Müller', actual['requested_name']
    refute_nil actual['time_processed']
  end
end
