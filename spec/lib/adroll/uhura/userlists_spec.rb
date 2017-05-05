require 'spec_helper'

describe AdRoll::Uhura::Userlists do
  let!(:basic_auth) { "#{AdRoll.user_name}:#{AdRoll.password}" }
  let!(:base_uri) { 'https://services.adroll.com/uhura/v1/userlists' }

  subject { described_class }

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

  describe '::segment' do
    let!(:request_uri) { "#{base_uri}/segment" }
    let!(:params) do
      { ad_eids: 'AD123' }
    end

    it 'calls the api with the correct params' do
      subject.segment(ad_eids: 'AD123')
      expect(WebMock).to have_requested(:get, request_uri).with(query: params)
    end
  end
end
