require 'spec_helper'

describe AdRoll::Api::Segment do
  let!(:base_uri) { 'https://api.adroll.com/v1/segment' }

  subject { described_class }

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
