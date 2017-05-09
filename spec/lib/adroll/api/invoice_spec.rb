require 'spec_helper'

describe AdRoll::Api::Invoice do
  let!(:base_uri) { 'https://services.adroll.com/api/v1/invoice' }

  subject { described_class }

  describe '::get' do
    let(:request_uri) { "#{base_uri}/get" }
    let(:params) do
      {
        invoice: 'abc123'
      }
    end

    it 'calls the api with the correct params' do
      subject.get(params)
      expect(WebMock).to have_requested(:get, request_uri)
        .with(query: params)
    end
  end
end
