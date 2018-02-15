require 'spec_helper'

describe AdRoll::Api::DynamicTemplateCapabilityDescription do
  let!(:basic_auth) { "#{AdRoll.user_name}:#{AdRoll.password}" }
  let!(:base_uri) { 'https://services.adroll.com/api/v1/dynamic_template_capability_description' }

  subject { described_class }

  before(:each) do
    request_uri << "?apikey=#{AdRoll.api_key}"
  end

  describe '::get_all' do
    let!(:request_uri) { "#{base_uri}/get_all" }

    it 'calls the api' do
      subject.get_all
      expect(WebMock).to have_requested(:get, request_uri)
    end
  end
end
