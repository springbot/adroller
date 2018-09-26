require 'spec_helper'

describe AdRoll::Uhura::GranularAttributions do
  let!(:basic_auth) { "#{AdRoll.user_name}:#{AdRoll.password}" }
  let!(:base_uri) { 'https://services.adroll.com/uhura/v1' }

  subject { described_class }

  before(:each) do
    request_uri << "?apikey=#{AdRoll.api_key}"
  end

  describe '::combined_granular_attributions' do
    let!(:request_uri) { "#{base_uri}/combined-granular-attributions" }
    let(:adv_eid) { "DHW7EFRHTJNNHJIN4N8VPL" }
    let!(:params) do
      {
        advertisable_eid: adv_eid,
        start_date: "2018-09-01",
        end_date: "2018-09-06"
      }
    end

    it 'calls the api with the correct params' do
      subject.combined_granular_attributions(advertisable_eid: adv_eid, start_date: Date.new(2018, 9, 1), end_date: Date.new(2018, 9, 6))
      expect(WebMock).to have_requested(:get, request_uri).with(query: params)
    end
  end
end
