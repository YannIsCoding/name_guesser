ENV['APP_ENV'] = 'test'

require 'app'
require 'test/unit'
require 'rack/test'

class AppTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  test 'with a known name and standard ascii charactere' do
    get '/?name=Martin'

    assert last_response.ok?
    expectation = { guessed_country: ['DE'], requested_name: 'Martin', time_processed: [] }.to_json
    assert_equal expectation, last_response.body
  end

  # def test_it_says_hello_to_a_person
  #   get '/', :name => 'Simon'
  #   assert last_response.body.include?('Simon')
  # end
end
