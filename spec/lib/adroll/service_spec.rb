require 'spec_helper'

describe AdRoll::Api::Service do
  describe ' make_api_call' do
    subject { described_class.new }

    context 'when request is for ad create' do
      let(:request_uri) do
        'https://services.adroll.com/api/v1/ad/create'
      end

      it 'uses HTTMultiParty to make the request' do
        expect(subject).to receive(:perform_multi_post)
        subject.send(:make_api_call, :post, request_uri, {})
      end
    end

    context 'when additional query param is provided on non GET request' do
      let(:request_uri) do
        'https://services.adroll.com/activate/api/v2'
      end

      it 'HTTP request with query parameters' do
        expect(subject).to receive(:perform_post_with_query)
        subject.send(:make_api_call, :post, request_uri, {}, {'some' => 'stuff'})
      end
    end

    context 'when environment is demo' do
      let(:request_uri) do
        'https://services.adroll.com/api/v1/ad/create'
      end

      before(:each) do
        ENV["RAILS_ENV"] = "demo"
      end

      after(:each) do
        ENV.delete("RAILS_ENV")
      end

      it 'uses the demo pathway' do
        expect(subject).to receive(:make_demo_response)
        subject.send(:make_api_call, :post, request_uri, {})
      end
    end
  end
end
