require 'spec_helper'

describe AdRoll::Prospecting::Campaigns do
  let!(:basic_auth) { "#{AdRoll.user_name}:#{AdRoll.password}" }
  let!(:base_uri) { 'https://services.adroll.com/prospecting/api/v2/campaigns' }
  let!(:campaign_eid) { 'SAMPLECAMPAIGNEID' }

  subject { described_class }

  before(:each) do
    request_uri << "?apikey=#{AdRoll.api_key}"
  end

  describe '::get' do
    let(:request_uri) { "#{base_uri}/#{campaign_eid}" }

    let(:params) do
      {
        active_adgroups_only: true,
        dirty_param: 'aaaa'
      }
    end

    let(:expected_param) do
      {
        active_adgroups_only: true
      }
    end

    it 'calls the api with the correct params' do
      subject.get(campaign_eid, params)
      expect(WebMock).to have_requested(:get, request_uri).with(query: expected_param)
    end
  end

  describe '::edit' do
    let(:params) do
      {
        admin_notes: 'abcd',
        currency_code: 'USD',
        name: 'campaign name',
        dirty_param: 'abcd'
      }
    end

    let(:expected_params) do
      {
        admin_notes: 'abcd',
        currency_code: 'USD',
        name: 'campaign name'
      }
    end

    let(:request_uri) { "#{base_uri}/#{campaign_eid}" }

    it 'calls the api with the correct params' do
      subject.edit(campaign_eid, params)
      expect(WebMock).to have_requested(:post, request_uri).with(body: expected_params.to_json)
    end
  end

  describe '::get_adgroups' do
    let(:request_uri) { "#{base_uri}/#{campaign_eid}/adgroups" }

    let(:params) do
      {
        is_active: true,
        dirty_param: 'aaaa'
      }
    end

    let(:expected_param) do
      {
        is_active: true
      }
    end

    it 'calls the api with the correct params' do
      subject.get_adgroups(campaign_eid, params)
      expect(WebMock).to have_requested(:get, request_uri).with(query: expected_param)
    end
  end

  describe '::create_adgroup' do
    let(:params) do
      {
        attribute_targets_segment: 'abcd',
        auto_audience: true,
        auto_geo_targets: true,
        dirty_param: 'abcd'
      }
    end

    let(:expected_params) do
      {
        attribute_targets_segment: 'abcd',
        auto_audience: true,
        auto_geo_targets: true
      }
    end

    let(:request_uri) { "#{base_uri}/#{campaign_eid}/adgroups" }

    it 'calls the api with the correct params' do
      subject.create_adgroup(campaign_eid, params)
      expect(WebMock).to have_requested(:post, request_uri).with(body: expected_params.to_json)
    end
  end

  describe '::get_geo_targets' do
    let(:request_uri) { "#{base_uri}/#{campaign_eid}/geo-targets" }

    let(:params) do
      {
        active_adgroups_only: true,
        dirty_param: 'aaaa'
      }
    end

    let(:expected_param) do
      {
        active_adgroups_only: true
      }
    end

    it 'calls the api with the correct params' do
      subject.get_geo_targets(campaign_eid, params)
      expect(WebMock).to have_requested(:get, request_uri).with(query: expected_param)
    end
  end
end
