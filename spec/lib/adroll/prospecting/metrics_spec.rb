require 'spec_helper'

describe AdRoll::Prospecting::Metrics do
  let!(:basic_auth) { "#{AdRoll.user_name}:#{AdRoll.password}" }
  let!(:base_uri) { 'https://services.adroll.com/prospecting/api/v2/metrics' }

  subject { described_class }

  before(:each) do
    request_uri << "?apikey=#{AdRoll.api_key}"
  end

  describe '::adgroup_ads' do
    let(:request_uri) { "#{base_uri}/adgroup-ads" }

    let(:params) do
      {
        start_date: '2020-01-01',
        end_date: '2025-12-25',
        adgroup_ad_eids: ['ABC', 'DEF'],
        dirty_param: 'abcd'
      }
    end

    let(:expected_params) do
      {
        start_date: '2020-01-01',
        end_date: '2025-12-25',
        adgroup_ad_eids: 'ABC,DEF'
      }
    end

    it 'calls the api with the correct params' do
      subject.adgroup_ads(params)
      expect(WebMock).to have_requested(:get, request_uri).with(query: expected_params)
    end
  end

  describe '::adgroups' do
    let(:request_uri) { "#{base_uri}/adgroups" }

    let(:params) do
      {
        start_date: '2020-01-01',
        end_date: '2025-12-25',
        adgroup_eids: ['ABC', 'DEF'],
        dirty_param: 'abcd'
      }
    end

    let(:expected_params) do
      {
        start_date: '2020-01-01',
        end_date: '2025-12-25',
        adgroup_eids: 'ABC,DEF'
      }
    end

    it 'calls the api with the correct params' do
      subject.adgroups(params)
      expect(WebMock).to have_requested(:get, request_uri).with(query: expected_params)
    end
  end

  describe '::advertisables' do
    let(:request_uri) { "#{base_uri}/advertisables" }

    let(:params) do
      {
        start_date: '2020-01-01',
        end_date: '2025-12-25',
        advertisable_eid: 'ABC',
        dirty_param: 'abcd'
      }
    end

    let(:expected_params) do
      {
        start_date: '2020-01-01',
        end_date: '2025-12-25',
        advertisable_eid: 'ABC'
      }
    end

    it 'calls the api with the correct params' do
      subject.advertisables(params)
      expect(WebMock).to have_requested(:get, request_uri).with(query: expected_params)
    end
  end

  describe '::campaigns' do
    let(:request_uri) { "#{base_uri}/campaigns" }

    let(:params) do
      {
        start_date: '2020-01-01',
        end_date: '2025-12-25',
        campaign_eids: ['ABC', 'DEF'],
        dirty_param: 'abcd'
      }
    end

    let(:expected_params) do
      {
        start_date: '2020-01-01',
        end_date: '2025-12-25',
        campaign_eids: 'ABC,DEF'
      }
    end

    it 'calls the api with the correct params' do
      subject.campaigns(params)
      expect(WebMock).to have_requested(:get, request_uri).with(query: expected_params)
    end
  end
end
