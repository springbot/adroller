require 'spec_helper'

describe AdRoll::Prospecting::Audiences do
  let!(:basic_auth) { "#{AdRoll.user_name}:#{AdRoll.password}" }
  let!(:base_uri) { 'https://services.adroll.com/prospecting/api/v2/audiences' }
  let!(:audience_eid) { 'SAMPLEAUDIENCEEID' }

  subject { described_class }

  before(:each) do
    request_uri << "?apikey=#{AdRoll.api_key}"
  end

  describe '::get' do
    let(:request_uri) { "#{base_uri}/#{audience_eid}" }

    it 'calls the api with the correct params' do
      subject.get(audience_eid)
      expect(WebMock).to have_requested(:get, request_uri).with(query: {})
    end
  end

  describe '::edit' do
    let(:params) do
      {
        size: 0,
        dirty_param: 'abcd'
      }
    end

    let(:expected_params) do
      {
        size: 0
      }
    end

    let(:request_uri) { "#{base_uri}/#{audience_eid}" }

    it 'calls the api with the correct params' do
      subject.edit(audience_eid, params)
      expect(WebMock).to have_requested(:post, request_uri).with(body: expected_params.to_json)
    end
  end
end
