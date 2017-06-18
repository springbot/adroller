require 'spec_helper'

describe AdRoll::Api::Facebook do
  let!(:base_uri) { 'https://services.adroll.com/facebook' }

  subject { described_class }

  before(:each) do
    request_uri << "?apikey=#{AdRoll.api_key}"
  end

  describe '::fb_page_url' do
    let(:request_uri) { "#{base_uri}/fb_page_url" }
    let(:params) do
      {
        advertiser_eid: 'abc123',
        page_url: '1234123'
      }
    end

    it 'calls the api with the correct params' do
      subject.fb_page_url(params)
      expect(WebMock).to have_requested(:post, request_uri)
        .with(body: params)
    end
  end

  describe '::instagram_account' do
    let(:request_uri) { "#{base_uri}/instagram_account" }
    let(:params) do
      {
        advertiser_eid: 'abc123',
        account_id: '1234123'
      }
    end

    it 'calls the api with the correct params' do
      subject.instagram_account(params)
      expect(WebMock).to have_requested(:post, request_uri)
        .with(body: params)
    end
  end
end
