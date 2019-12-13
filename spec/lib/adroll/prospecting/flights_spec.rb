require 'spec_helper'

describe AdRoll::Prospecting::Flights do
  let!(:basic_auth) { "#{AdRoll.user_name}:#{AdRoll.password}" }
  let!(:base_uri) { 'https://services.adroll.com/prospecting/api/v2/flights' }
  let!(:flight_eid) { 'SAMPLEFLIGHTEID' }

  subject { described_class }

  before(:each) do
    request_uri << "?apikey=#{AdRoll.api_key}"
  end

  describe '::edit' do
    let(:request_uri) { "#{base_uri}/#{flight_eid}" }

    let(:params) do
      {
        start_date: '2020-01-01',
        end_date: '2025-12-25',
        dirty_param: 'abcd'
      }
    end

    let(:expected_params) do
      {
        start_date: '2020-01-01',
        end_date: '2025-12-25'
      }
    end

    it 'calls the api with the correct params' do
      subject.edit(flight_eid, params)
      expect(WebMock).to have_requested(:put, request_uri).with(body: expected_params.to_json)
    end
  end

  describe '::delete' do
    let(:params) do
      {
        event_source: '49er',
        dirty_param: 'abcd'
      }
    end

    let(:expected_params) do
      {
        event_source: '49er'
      }
    end

    let(:request_uri) { "#{base_uri}/#{flight_eid}" }

    it 'calls the api with the correct params' do
      subject.delete(flight_eid, params)
      expect(WebMock).to have_requested(:delete, request_uri).with(body: expected_params.to_json)
    end
  end
end
