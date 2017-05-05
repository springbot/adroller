require 'spec_helper'

describe AdRoll::Api::RollcrawlConfiguration do
  let!(:base_uri) { 'https://services.adroll.com/api/v1/rollcrawl_configuration' }

  subject { described_class }

  describe '::edit' do
    let(:request_uri) { "#{base_uri}/edit" }
    let(:params) do
      {
        advertisable: 'abc123'
      }
    end

    it 'calls the api with the correct params' do
      subject.edit(params)
      expect(WebMock).to have_requested(:put, request_uri)
        .with(body: params)
    end
  end

  describe '::get' do
    let(:request_uri) { "#{base_uri}/get" }
    let(:params) do
      {
        advertisable: 'abc123'
      }
    end

    it 'calls the api with the correct params' do
      subject.get(params)
      expect(WebMock).to have_requested(:get, request_uri)
        .with(query: params)
    end
  end

  describe '::add_feed_config' do
    let(:request_uri) { "#{base_uri}/add_feed_config" }
    let(:params) do
      {
        advertisable: 'abc123',
        feed_url: 'http://url.com'
      }
    end

    before do
      params[:feed_url] = CGI.escape(params[:feed_url])
    end

    it 'call the api with the correct params' do
      subject.add_feed_config(params)
      expect(WebMock).to have_requested(:post, request_uri)
        .with(body: params)
    end
  end
end
