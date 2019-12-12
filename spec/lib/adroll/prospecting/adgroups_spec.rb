require 'spec_helper'

describe AdRoll::Prospecting::Adgroups do
  let!(:basic_auth) { "#{AdRoll.user_name}:#{AdRoll.password}" }
  let!(:base_uri) { 'https://services.adroll.com/prospecting/api/v2/adgroups' }

  subject { described_class }

  before(:each) do
    request_uri << "?apikey=#{AdRoll.api_key}"
  end

  describe '::get' do
    let(:params) do
      {
        adgroup: 'SAMPLEEID',
        dirty_param: 'abcd',
      }
    end

    let(:request_uri) { "#{base_uri}/#{params[:adgroup].to_s}" }

    it 'calls the api with the correct params' do
      subject.get(params)
      expect(WebMock).to have_requested(:get, request_uri).with(query: {})
    end
  end

  describe '::edit' do
    let(:params) do
      {
        adgroup: 'SAMPLEEID',
        ads: [{
          ad_eid: 'SAMPLEADEID',
          admin_status: 'live',
          event_source: 'fortyniner-ui',
          is_active: true,
          skip_approve_ad: true,
          user_status: 'abcd'
        }],
        auto_audience: true,
        dirty_param: 'abcd'
      }
    end

    let(:expected_params) do
      subject.send(:sanitize_params, params)
    end

    let(:request_uri) { "#{base_uri}/#{params[:adgroup].to_s}" }

    fit 'calls the api with the correct params' do
      subject.edit(params)
      expect(WebMock).to have_requested(:post, request_uri).with(body: expected_params.to_json)
    end
  end
end
