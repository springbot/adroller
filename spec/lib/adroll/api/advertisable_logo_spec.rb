require 'spec_helper'

describe AdRoll::Api::AdvertisableLogo do
  let!(:base_uri) { 'https://services.adroll.com/api/v1/advertisable_logo' }

  subject { described_class }

  before(:each) do
    request_uri << "?apikey=#{AdRoll.api_key}"
  end

  describe '::create' do
    let!(:request_uri) { "#{base_uri}/create" }

    let!(:params) do
      {
        advertisable: 'coolmom123',
        logo_file: 'lamedad987'
      }
    end

    it 'calls the api with the correct params' do
      subject.create(params)
      expect(WebMock).to have_requested(:post, request_uri).with(body: params)
    end
  end
end
