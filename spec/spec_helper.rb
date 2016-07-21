require 'simplecov'
SimpleCov.start

require 'codecov'
SimpleCov.formatter = SimpleCov::Formatter::Codecov

require 'adroller'
require 'pry-byebug'
require 'factory_girl'
require 'webmock/rspec'

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.filter_run focus: true
  config.run_all_when_everything_filtered = true
  config.color = true

  config.before(:each) do
    stub_request(:any, /https:\/\/api.adroll.com\/v1\/.*/)
      .with(basic_auth: ['USERNAME', 'PASSWORD'])
      .to_return(status: [200, 'OK'], body: { results: {} }.to_json)

    AdRoll::Api.set_account_data('USERNAME', 'PASSWORD', 'ORG123XYZ')
  end
end

FactoryGirl.definition_file_paths = [File.expand_path('../factories', __FILE__)]
FactoryGirl.find_definitions

ENV['ADROLL_USERNAME'] = 'USERNAME'
ENV['ADROLL_PASSWORD'] = 'PASSWORD'
ENV['ADROLL_ORGANIZATION_EID'] = 'ORG123XYZ'
