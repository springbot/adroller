require 'spec_helper'

class Dummy
  include AdRoll::Api
end

describe AdRoll::Api do
  subject { Dummy }

  it 'should return username' do
    expect(subject.user_name).to eq 'USERNAME'
  end

  it 'should return password' do
    expect(subject.password).to eq 'PASSWORD'
  end

  it 'should return organization eid' do
    expect(subject.organization_eid).to eq 'ORG123XYZ'
  end

  it 'should return the base url for api endpoints' do
    expect(subject.base_url).to eq 'https://api.adroll.com/v1'
  end

end
