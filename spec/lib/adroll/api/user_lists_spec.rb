require 'spec_helper'

describe AdRoll::Api::UserLists do
  let!(:basic_auth) { "#{AdRoll.user_name}:#{AdRoll.password}" }
  let!(:base_uri) { 'https://services.adroll.com/user-lists/api/v1/userlists' }

  subject { described_class }

  before(:each) do
    request_uri << "?apikey=#{AdRoll.api_key}"
  end

  describe '::ad' do
    let(:request_uri) { "#{base_uri}/ad" }
    let(:params) do
      {
        breakdowns: 'entity',
        advertisable_eid: 'ABCD1234'
      }
    end

    it 'calls the api with the correct params' do
      subject.ad(params)
      expect(WebMock).to have_requested(:get, request_uri)
        .with(query: params)
    end
  end

  describe '::adgroup' do
    let(:request_uri) { "#{base_uri}/adgroup" }
    let(:params) do
      {
        breakdowns: 'entity',
        advertisable_eid: 'ABCD1234'
      }
    end

    it 'calls the api with the correct params' do
      subject.adgroup(params)
      expect(WebMock).to have_requested(:get, request_uri)
        .with(query: params)
    end
  end

  describe '::advertisable' do
    let(:request_uri) { "#{base_uri}/advertisable" }
    let(:params) do
      {
        breakdowns: 'entity',
        advertisable_eid: 'ABCD1234'
      }
    end

    it 'calls the api with the correct params' do
      subject.advertisable(params)
      expect(WebMock).to have_requested(:get, request_uri)
        .with(query: params)
    end
  end

  describe '::segment' do
    let(:request_uri) { "#{base_uri}/segment" }
    let(:params) do
      {
        breakdowns: 'entity',
        advertisable_eid: 'ABCD1234'
      }
    end

    context 'when GET request' do
      it 'calls the api with the correct params' do
        subject.segment(params)
        expect(WebMock).to have_requested(:get, request_uri)
          .with(query: params)
      end
    end

    context 'when POST request' do
      let(:params) do
        {
          breakdowns: ['entity'],
          advertisable_eid: 'ABCD1234'
        }
      end

      it 'calls the api with the correct params' do
        subject.segment(params, :post)
        expect(WebMock).to have_requested(:post, request_uri)
          .with(body: params)
      end
    end
  end
end
