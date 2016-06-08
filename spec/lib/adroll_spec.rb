require 'spec_helper'

class Dummy
  include AdRoll::Api
end

describe AdRoll::Api do
  subject { Dummy }

  describe 'when included' do
    it 'should define user_name with attr_accessor' do
      expect(subject.respond_to?(:user_name)).to be_truthy
      expect(subject.respond_to?(:user_name=)).to be_truthy
    end

    it 'should define password with attr_accessor' do
      expect(subject.respond_to?(:password)).to be_truthy
      expect(subject.respond_to?(:password=)).to be_truthy
    end

    it 'should define organization_eid with attr_accessor' do
      expect(subject.respond_to?(:organization_eid)).to be_truthy
      expect(subject.respond_to?(:organization_eid=)).to be_truthy
    end

    it 'should define self.base_url' do
      expect(subject.base_url).to eq 'https://api.adroll.com/v1'
    end
  end
end
