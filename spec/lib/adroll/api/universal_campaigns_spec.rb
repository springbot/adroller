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
          
        }
      end

      subject.adgroup(params, :get)
    end

    context 'on POST request' do
      subject.adgroup(params, :post)
    end

    context 'on PUT request' do
      subject.adgroup(params, :put)
    end

    let!(:params) do
      {
        name: 'name',
        headline: 'headline',
        body: 'body'
      }
    end

    it 'calls the api with the correct params' do
      subject.clone(name: 'name', headline: 'headline', body: 'body')
      expect(WebMock).to have_requested(:post, request_uri).with(body: params)
    end
  end
end
