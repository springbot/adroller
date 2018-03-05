require 'spec_helper'

describe AdRoll::Api::Service do
  describe ' make_api_call' do
    context 'when request is for ad create' do
      let(:request_uri) do
        'https://services.adroll.com/api/v1/ad/create'
      end

      subject { described_class.new }

      it 'uses HTTMultiParty to make the request' do
        expect(subject).to receive(:perform_multi_post)
        subject.send(:make_api_call, :post, request_uri, {})
      end
    end
  end
end
