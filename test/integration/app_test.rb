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
    expectation = { guessed_country: ['DE'], requested_name: 'Martin', time_processed: [] }.to_json
    assert_equal expectation, last_response.body
  end

  test 'with a known name and non-standard ascii charactere' do
    get '/', :name => 'Müller'

    expectation = { guessed_country: ['DE'], requested_name: 'Müller', time_processed: [] }.to_json
    assert_equal expectation, last_response.body
  end
end
