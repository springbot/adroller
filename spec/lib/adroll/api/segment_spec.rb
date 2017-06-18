require 'spec_helper'

describe AdRoll::Api::Segment do
  let!(:base_uri) { 'https://services.adroll.com/api/v1/segment' }

  subject { described_class }

  before(:each) do
    request_uri << "?apikey=#{AdRoll.api_key}"
  end

  describe '::edit' do
    let(:request_uri) { "#{base_uri}/edit" }
    let(:params) do
      {
        segment: 'abc123',
        conversion_value: '10',
        duration: '30'
      }
    end

    it 'calls the api with the correct params' do
      subject.edit(params)
      expect(WebMock).to have_requested(:post, request_uri)
        .with(body: params)
    end
  end

  describe '::get' do
    let(:request_uri) { "#{base_uri}/get" }
    let(:params) do
      {
        segment: 'abc123'
      }
    end

    it 'calls the api with the correct params' do
      subject.get(params)
      expect(WebMock).to have_requested(:get, request_uri)
        .with(query: params)
    end
  end
end
