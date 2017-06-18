require 'spec_helper'

describe AdRoll::Api::User do
  let!(:base_uri) { 'https://services.adroll.com/api/v1/user' }

  subject { described_class }

  before(:each) do
    request_uri << "?apikey=#{AdRoll.api_key}"
  end

  describe '::deactivate' do
    let(:request_uri) { "#{base_uri}/deactivate" }
    let(:params) do
      {
        user: 'abc123'
      }
    end

    it 'calls the api with the correct params' do
      subject.deactivate(params)
      expect(WebMock).to have_requested(:get, request_uri)
        .with(query: params)
    end
  end

  describe '::edit' do
    let(:request_uri) { "#{base_uri}/edit" }
    let(:params) do
      {
        u: 'abc123',
        username: 'myusername',
        first_name: 'User',
        last_name: 'Name',
        email_preference_general: 'true',
        email_preference_payment: 'false',
        email_preference_campaign_notifications: 'true'
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
        user: 'abc123'
      }
    end

    it 'calls the api with the correct params' do
      subject.get(params)
      expect(WebMock).to have_requested(:get, request_uri)
        .with(query: params)
    end
  end

  describe '::grant' do
    let(:request_uri) { "#{base_uri}/grant" }
    let(:params) do
      {
        u: 'abc123',
        advertisables: ['def456'],
        organization_role: 'user'
      }
    end

    it 'calls the api with the correct params' do
      subject.grant(params)
      expect(WebMock).to have_requested(:post, request_uri)
        .with(body: params)
    end
  end
end
