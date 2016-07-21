require 'spec_helper'

describe AdRoll::Client do
  context 'when a service is called' do
    let(:ad_spy) { double(:ad, create: true) }
    let(:params) do
      {
        user_name: 'foo',
        password: 'bar',
        organization_eid: 'spam'
      }
    end
    before do
      allow(AdRoll::Api::Ad).to receive(:new) { ad_spy }
    end

    subject(:client) { described_class.new params }

    it 'should create a new instance of that service' do
      client.ad.create 'foo'
      expect(ad_spy).to have_received(:create).with 'foo'
    end
  end
end
