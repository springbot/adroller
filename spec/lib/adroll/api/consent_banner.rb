require 'spec_helper'

describe AdRoll::Api::ConsentBanner do
  let!(:base_uri) { 'https://services.adroll.com/api/v1/consent_banner' }

  subject { described_class }

  before(:each) do
    request_uri << "?apikey=#{AdRoll.api_key}"
  end

  describe '::get' do
    let(:request_uri) { "#{base_uri}/get" }
    let(:params) do
      {
        advertisable: 'abc123'
      }
    end

    it 'calls the api with the correct params' do
      subject.update(params)
      expect(WebMock).to have_requested(:get, request_uri)
        .with(query: params)
    end
  end

  describe '::update' do
    let(:request_uri) { "#{base_uri}/update" }
    let(:params) do
      {
        advertisable: 'abc123',
        state: 'adroll'
      }
    end

    it 'calls the api with the correct params' do
      subject.update(params)
      expect(WebMock).to have_requested(:post, request_uri)
        .with(query: params)
    end
  end
end