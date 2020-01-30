require 'spec_helper'

describe AdRoll::Api::Audience do
  let!(:base_uri) { 'https://services.adroll.com/audience/v1' }

  subject { described_class }

  before(:each) do
    request_uri << "?apikey=#{AdRoll.api_key}"
  end

  describe '::get' do
    let(:advertisable_eid) { 'FAKEADVERTISABLEEID' }
    let!(:request_uri) { "#{base_uri}/user_attribute_names/#{advertisable_eid}" }

    let!(:params) do
      {
        first_party: true
      }
    end

    it 'calls the api with the correct params' do
      subject.user_attribute_names(advertisable_eid, params)
      expect(WebMock).to have_requested(:get, request_uri)
        .with(query: params)
    end
  end
end
