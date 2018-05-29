require 'spec_helper'

describe AdRoll::Api::UniversalCampaigns do
  let!(:basic_auth) { "#{AdRoll.user_name}:#{AdRoll.password}" }
  let!(:base_uri) { 'https://services.adroll.com/activate/api/v2' }

  subject { described_class }

  before(:each) do
    request_uri << "?apikey=#{AdRoll.api_key}"
  end

  describe '::adgroup' do
    let!(:request_uri) { "#{base_uri}/adgroup" }

    context 'on GET request' do
      let(:params) do
        {
          eid: 'RANDOMENTITYID',
          campaign_eid: 'CAMPAIGNRANDOMEID'
        }
      end

      it 'calls the API with correct params' do
        subject.adgroup(params, :get)
        expect(WebMock).to have_requested(:get, request_uri)
          .with(query: params)
      end
    end

    context 'on POST request' do
      let(:params) do
        {
          
        }
      end

      it 'calls the API with correct params' do
        subject.adgroup(params, :post)
      end
    end

    context 'on PUT request' do
      it 'calls the API with correct params' do
        subject.adgroup(params, :put)
      end
    end
  end
end
