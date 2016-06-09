require 'spec_helper'

class Dummy
  include AdRoll::Api
end

describe AdRoll::Api do
  subject { Dummy }

  describe '#set_account_data' do
    before do
      subject.set_account_data(user_name: 'username', password: 'abc', organization_eid: 'abc123')
    end

    it 'sets user_name' do
      expect(AdRoll::Api.user_name).to eq('username')
    end

    it 'sets password' do
      expect(AdRoll::Api.password).to eq('abc')
    end

    it 'sets organization_eid' do
      expect(AdRoll::Api.organization_eid).to eq('abc123')
    end
  end
end
