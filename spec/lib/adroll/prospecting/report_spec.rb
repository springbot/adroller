require 'spec_helper'

describe AdRoll::Prospecting::Report do
  let!(:basic_auth) { "#{AdRoll.user_name}:#{AdRoll.password}" }
  let!(:base_uri) { 'https://services.adroll.com/prospecting/api/v2/report' }

  subject { described_class }

  before(:each) do
    request_uri << "?apikey=#{AdRoll.api_key}"
  end

  describe '::ad' do
    let(:request_uri) { "#{base_uri}/ad" }

    let(:params) do
      {
        start_date: '2020-01-01',
        end_date: '2025-12-25',
        ad_eids: ['ABC', 'DEF'],
        dirty_param: 'abcd'
      }
    end

    let(:expected_params) do
      {
        start_date: '2020-01-01',
        end_date: '2025-12-25',
        ad_eids: 'ABC,DEF'
      }
    end

    it 'calls the api with the correct params' do
      subject.ad(params)
      expect(WebMock).to have_requested(:get, request_uri).with(query: expected_params)
    end
  end

  describe '::adgroup' do
    let(:request_uri) { "#{base_uri}/adgroup" }

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
      subject.adgroup(params)
      expect(WebMock).to have_requested(:get, request_uri).with(query: expected_params)
    end
  end

  describe '::assisted' do
    let(:request_uri) { "#{base_uri}/assisted" }

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
      subject.assisted(params)
      expect(WebMock).to have_requested(:get, request_uri).with(query: expected_params)
    end
  end

  describe '::campaign' do
    let(:request_uri) { "#{base_uri}/campaign" }

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
      subject.campaign(params)
      expect(WebMock).to have_requested(:get, request_uri).with(query: expected_params)
    end
  end

  describe '::gcr' do
    let(:request_uri) { "#{base_uri}/gcr" }

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
      subject.gcr(params)
      expect(WebMock).to have_requested(:get, request_uri).with(query: expected_params)
    end
  end

  describe '::insights' do
    let(:request_uri) { "#{base_uri}/insights" }

    let(:params) do
      {
        start_date: '2020-01-01',
        end_date: '2025-12-25',
        advertisable_eid: 'ABC',
        reports: 'csv',
        dirty_param: 'abcd'
      }
    end

    let(:expected_params) do
      {
        start_date: '2020-01-01',
        end_date: '2025-12-25',
        advertisable_eid: 'ABC',
        reports: 'csv'
      }
    end

    it 'calls the api with the correct params' do
      subject.insights(params)
      expect(WebMock).to have_requested(:get, request_uri).with(query: expected_params)
    end
  end
end
