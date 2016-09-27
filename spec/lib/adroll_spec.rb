require 'spec_helper'

describe AdRoll do
  describe '.api_service_classes' do
    subject(:api_service_classes) { described_class.api_service_classes }

    it { is_expected.to include AdRoll::Api::Ad }
  end

  describe '.api_services' do
    subject(:api_services) { described_class.api_services }

    it { is_expected.to include :Ad }
  end

  describe '.uhura_service_classes' do
    subject(:uhura_service_classes) { described_class.uhura_service_classes }

    it { is_expected.to include AdRoll::Uhura::Attributions }
  end

  describe '.uhura_services' do
    subject(:uhura_services) { described_class.uhura_services }

    it { is_expected.to include :Deliveries }
  end

  context 'when using enviroment variables' do
    it 'sets user_name' do
      expect(AdRoll.user_name).to eq('USERNAME')
    end

    it 'sets password' do
      expect(AdRoll.password).to eq('PASSWORD')
    end

    it 'sets organization_eid' do
      expect(AdRoll.organization_eid).to eq('ORG123XYZ')
    end
  end

  context 'when using include' do
    class Dummy
      include AdRoll
    end

    subject { Dummy }

    before do
      subject.set_account_data(user_name: 'username', password: 'abc', organization_eid: 'abc123')
    end

    it 'sets user_name' do
      expect(AdRoll.user_name).to eq('username')
    end

    it 'sets password' do
      expect(AdRoll.password).to eq('abc')
    end

    it 'sets organization_eid' do
      expect(AdRoll.organization_eid).to eq('abc123')
    end
  end
end
