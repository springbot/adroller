require 'spec_helper'

describe AdRoll::Api::Product do
  let!(:base_uri) { 'https://services.adroll.com/api/v1/product' }

  subject { described_class }

  before(:each) do
    request_uri << "?apikey=#{AdRoll.api_key}"
  end

  describe '::recommendations_preview' do
    let!(:request_uri) { "#{base_uri}/recommendations_preview" }

    let!(:params) do
      {
        advertisable_eid: 'abc123'
      }
    end

    it 'calls the api with the correct params' do
      subject.recommendations_preview(advertisable_eid: 'abc123')
      expect(WebMock).to have_requested(:get, request_uri).with(query: params)
    end
  end
end
