require 'spec_helper'

describe AdRoll::Api::DynamicTemplate do
  let!(:basic_auth) { "#{AdRoll.user_name}:#{AdRoll.password}" }
  let!(:base_uri) { 'https://services.adroll.com/api/v1/dynamic_template' }

  subject { described_class }

  before(:each) do
    request_uri << "?apikey=#{AdRoll.api_key}"
  end

  describe '::get_all_for_advertisable' do
    let!(:request_uri) { "#{base_uri}/get_all_for_advertisable" }

    let!(:params) do
      {
        advertisable: 'advertisable'
      }
    end

    it 'calls the api with the correct params' do
      subject.get_all_for_advertisable(advertisable: 'advertisable')
      expect(WebMock).to have_requested(:get, request_uri)
        .with(query: params)
    end
  end
end
