require 'spec_helper'

describe AdRoll::Prospecting::Reports do
  let!(:basic_auth) { "#{AdRoll.user_name}:#{AdRoll.password}" }
  let!(:base_uri) { 'https://services.adroll.com/prospecting/api/v2/reports' }

  subject { described_class }

  before(:each) do
    request_uri << "?apikey=#{AdRoll.api_key}"
  end

  describe '::campaign' do
    let(:request_uri) { "#{base_uri}/campaign" }

    let(:params) do
      {
        start_date: '2020-01-01',
        end_date: '2025-12-25',
        data_format: 'csv',
        dirty_param: 'abcd'
      }
    end

    let(:expected_params) do
      {
        start_date: '2020-01-01',
        end_date: '2025-12-25',
        data_format: 'csv'
      }
    end

    it 'calls the api with the correct params' do
      subject.campaign(params)
      expect(WebMock).to have_requested(:get, request_uri).with(query: expected_params)
    end
  end

  describe '::insights_data' do
    let(:request_uri) { "#{base_uri}/insights-data" }

    let(:params) do
      {
        start_date: '2020-01-01',
        end_date: '2025-12-25',
        data_format: 'csv',
        dirty_param: 'abcd'
      }
    end

    let(:expected_params) do
      {
        start_date: '2020-01-01',
        end_date: '2025-12-25',
        data_format: 'csv'
      }
    end

    it 'calls the api with the correct params' do
      subject.insights_data(params)
      expect(WebMock).to have_requested(:get, request_uri).with(query: expected_params)
    end
  end
end
