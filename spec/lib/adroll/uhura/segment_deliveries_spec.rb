require 'spec_helper'

describe AdRoll::Uhura::SegmentDeliveries do
  let!(:basic_auth) { "#{AdRoll.user_name}:#{AdRoll.password}" }
  let!(:base_uri) { 'https://app.adroll.com/uhura/v1/segment-deliveries' }

  subject { described_class }

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
