require 'spec_helper'

describe AdRoll::Client do
  describe 'all routes' do
    client = AdRoll::Client.new user_name: 'USERNAME', password: 'PASSWORD', organization_eid: 'ORG123XYZ'

    # classes = [AdRoll::Api::MobileApp]
    classes = AdRoll::Api.service_classes
    classes.each do |service|
      service_method = service.service_method
      service.instance_methods(false).each do |method|
        ar = []
        hsh = {}

        service.instance_method(method).parameters.map do |param|
          case param[0]
          when :req
            ar << {}
          when :keyreq
            hsh[param[1]] = rand(1..10)
          end
        end


        it "#{service.name}##{service_method} is expected to call #{method}" do
          if ar.empty?
            client.send(service_method).send(method, hsh)
          else
            client.send(service_method).send(method, *ar)
          end
          expect(WebMock).to have_requested(:any, /.*\/#{service_method}/)
        end
      end
    end
  end

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
