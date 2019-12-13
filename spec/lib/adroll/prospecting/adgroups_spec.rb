require 'spec_helper'

describe AdRoll::Prospecting::Adgroups do
  let!(:basic_auth) { "#{AdRoll.user_name}:#{AdRoll.password}" }
  let!(:base_uri) { 'https://services.adroll.com/prospecting/api/v2/adgroups' }
  let!(:adgroup_eid) { 'SAMPLEADGROUPEID' }

  subject { described_class }

  before(:each) do
    request_uri << "?apikey=#{AdRoll.api_key}"
  end

  describe '::get' do
    let(:request_uri) { "#{base_uri}/#{adgroup_eid}" }

    it 'calls the api with the correct params' do
      subject.get(adgroup_eid)
      expect(WebMock).to have_requested(:get, request_uri).with(query: {})
    end
  end

  describe '::edit' do
    let(:params) do
      {
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

    let(:request_uri) { "#{base_uri}/#{adgroup_eid}" }

    it 'calls the api with the correct params' do
      subject.edit(adgroup_eid, params)
      expect(WebMock).to have_requested(:post, request_uri).with(body: expected_params.to_json)
    end
  end

  describe '::get_audience' do
    let(:request_uri) { "#{base_uri}/#{adgroup_eid}/audience" }

    it 'calls the api with the correct params' do
      subject.get_audience(adgroup_eid)
      expect(WebMock).to have_requested(:get, request_uri).with(query: {})
    end
  end

  describe '::edit_audience' do
    let(:params) do
      {
        event_source: 'fortyniner-ui',
        dirty_param: 'abcd'
      }
    end

    let(:expected_params) do
      subject.send(:sanitize_params, params)
    end

    let(:request_uri) { "#{base_uri}/#{adgroup_eid}/audience" }

    it 'calls the api with the correct params' do
      subject.edit_audience(adgroup_eid, params)
      expect(WebMock).to have_requested(:post, request_uri).with(body: expected_params.to_json)
    end
  end

  describe '::get_flights' do
    let(:request_uri) { "#{base_uri}/#{adgroup_eid}/flights" }

    it 'calls the api with the correct params' do
      subject.get_flights(adgroup_eid)
      expect(WebMock).to have_requested(:get, request_uri).with(query: {})
    end
  end

  describe '::edit_flights' do
    let(:params) do
      {
        event_source: 'fortyniner-ui',
        dirty_param: 'abcd'
      }
    end

    let(:expected_params) do
      subject.send(:sanitize_params, params)
    end

    let(:request_uri) { "#{base_uri}/#{adgroup_eid}/flights" }

    it 'calls the api with the correct params' do
      subject.edit_flights(adgroup_eid, params)
      expect(WebMock).to have_requested(:post, request_uri).with(body: expected_params.to_json)
    end
  end

  describe '::get_geo_targets' do
    let(:request_uri) { "#{base_uri}/#{adgroup_eid}/geo-targets" }

    it 'calls the api with the correct params' do
      subject.get_geo_targets(adgroup_eid)
      expect(WebMock).to have_requested(:get, request_uri).with(query: {})
    end
  end

  describe '::edit_geo_targets' do
    let(:params) do
      [{
        eid: 'GEOTARGETEIDSAMPLE',
        operation: 'someoperation'
      }]
    end

    let(:expected_params) do
      subject.send(:sanitize_params, params)
    end

    let(:request_uri) { "#{base_uri}/#{adgroup_eid}/geo-targets" }

    it 'calls the api with the correct params' do
      subject.edit_geo_targets(adgroup_eid, params)
      expect(WebMock).to have_requested(:post, request_uri).with(body: expected_params.to_json)
    end
  end
end
