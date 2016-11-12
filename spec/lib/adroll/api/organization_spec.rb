require 'spec_helper'

describe AdRoll::Api::Organization do
  let!(:base_uri) { 'https://api.adroll.com/v1/organization' }

  subject { described_class }

  describe '::get' do
    let!(:request_uri) { "#{base_uri}/get" }

    let!(:params) do
      {
        organization: 'abc123'
      }
    end

    it 'calls the api with the correct params' do
      subject.get(organization: 'abc123')
      expect(WebMock).to have_requested(:get, request_uri).with(query: params)
    end
  end

  describe '::get_advertisables' do
    let!(:request_uri) { "#{base_uri}/get_advertisables" }

    let!(:params) do
      {
        organization: 'abc123'
      }
    end

    it 'calls the api with the correct params' do
      subject.get_advertisables(organization: 'abc123')
      expect(WebMock).to have_requested(:get, request_uri).with(query: params)
    end
  end

  describe '::get_billing_methods' do
    let!(:request_uri) { "#{base_uri}/get_billing_methods" }

    let!(:params) do
      {
        organization: 'abc123'
      }
    end

    it 'calls the api with the correct params' do
      subject.get_billing_methods(organization: 'abc123')
      expect(WebMock).to have_requested(:get, request_uri).with(query: params)
    end
  end

  describe '::get_users' do
    let!(:request_uri) { "#{base_uri}/get_users" }

    let!(:params) do
      {
        organization: 'abc123'
      }
    end

    it 'calls the api with the correct params' do
      subject.get_users(organization: 'abc123')
      expect(WebMock).to have_requested(:get, request_uri).with(query: params)
    end
  end

  describe '::reset' do
    let!(:request_uri) { "#{base_uri}/reset" }

    let!(:params) do
      {
        organization: 'abc123'
      }
    end

    it 'calls the api with the correct params' do
      subject.reset(organization: 'abc123')
      expect(WebMock).to have_requested(:get, request_uri).with(query: params)
    end
  end
end
