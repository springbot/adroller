require 'spec_helper'

describe AdRoll::Uhura::Deliveries do
  let!(:basic_auth) { "#{AdRoll.user_name}:#{AdRoll.password}" }
  let!(:base_uri) { 'https://services.adroll.com/uhura/v1/deliveries' }

  subject { described_class }

  before(:each) do
    request_uri << "?apikey=#{AdRoll.api_key}"
  end

  describe '::ad' do
    let!(:request_uri) { "#{base_uri}/ad" }
    let!(:params) do
      { ad_eids: 'AD123' }
    end

    it 'calls the api with the correct params' do
      subject.ad(ad_eids: 'AD123')
      expect(WebMock).to have_requested(:get, request_uri).with(query: params)
    end
  end

  describe '::adgroup' do
    let!(:request_uri) { "#{base_uri}/adgroup" }
    let!(:params) do
      { ad_eids: 'AD123' }
    end

    it 'calls the api with the correct params' do
      subject.adgroup(ad_eids: 'AD123')
      expect(WebMock).to have_requested(:get, request_uri).with(query: params)
    end
  end

  describe '::advertisable' do
    let!(:request_uri) { "#{base_uri}/advertisable" }
    let!(:params) do
      { ad_eids: 'AD123' }
    end

    it 'calls the api with the correct params' do
      subject.advertisable(ad_eids: 'AD123')
      expect(WebMock).to have_requested(:get, request_uri).with(query: params)
    end
  end

  describe '::campaign' do
    let!(:request_uri) { "#{base_uri}/campaign" }
    let!(:params) do
      { ad_eids: 'AD123' }
    end

    it 'calls the api with the correct params' do
      subject.campaign(ad_eids: 'AD123')
      expect(WebMock).to have_requested(:get, request_uri).with(query: params)
    end
  end

  describe '::domain' do
    let!(:request_uri) { "#{base_uri}/domain" }
    let!(:params) do
      { ad_eids: 'AD123' }
    end

    it 'calls the api with the correct params' do
      subject.domain(ad_eids: 'AD123')
      expect(WebMock).to have_requested(:get, request_uri).with(query: params)
    end
  end

  describe '::export' do
    let!(:request_uri) { "#{base_uri}/export" }
    let!(:params) do
      { ad_eids: 'AD123' }
    end

    it 'calls the api with the correct params' do
      subject.export(ad_eids: 'AD123')
      expect(WebMock).to have_requested(:get, request_uri).with(query: params)
    end
  end
end
