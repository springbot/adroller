require 'spec_helper'

describe AdRoll::Prospecting::Advertisables do
  let!(:basic_auth) { "#{AdRoll.user_name}:#{AdRoll.password}" }
  let!(:base_uri) { 'https://services.adroll.com/prospecting/api/v2/advertisables' }
  let!(:advertisable_eid) { 'SAMPLEADVERTISABLEEID' }

  subject { described_class }

  before(:each) do
    request_uri << "?apikey=#{AdRoll.api_key}"
  end

  describe '::get_campaigns' do
    let(:request_uri) { "#{base_uri}/#{advertisable_eid}/campaigns" }

    let(:params) do
      { is_active: true }
    end

    it 'calls the api with the correct params' do
      subject.get_campaigns(advertisable_eid, params)
      expect(WebMock).to have_requested(:get, request_uri).with(query: params)
    end
  end

  describe '::create_campaign' do
    let(:params) do
      {
        ads: "ABCDEFG,HIJKLMN,OPQRSTUV,WYXZ",
        admin_notes: "admin note sample",
        dirty_param: 'abcd'
      }
    end

    let(:expected_params) do
      subject.send(:sanitize_params, params)
    end

    let(:request_uri) { "#{base_uri}/#{advertisable_eid}/campaigns" }

    it 'calls the api with the correct params' do
      subject.create_campaign(advertisable_eid, params)
      expect(WebMock).to have_requested(:post, request_uri).with(body: expected_params.to_json)
    end
  end

  describe '::edit_campaigns' do
    let(:params) do
      {
        currency_code: "USD",
        user_status: "paused",
        dirty_param: 'abcd'
      }
    end

    let(:expected_params) do
      subject.send(:sanitize_params, params)
    end

    let(:request_uri) { "#{base_uri}/#{advertisable_eid}/campaigns" }

    it 'calls the api with the correct params' do
      subject.edit_campaigns(advertisable_eid, params)
      expect(WebMock).to have_requested(:patch, request_uri).with(body: expected_params.to_json)
    end
  end

  describe '::get_settings' do
    let(:request_uri) { "#{base_uri}/#{advertisable_eid}/settings" }

    it 'calls the api with the correct params' do
      subject.get_settings(advertisable_eid)
      expect(WebMock).to have_requested(:get, request_uri).with(query: {})
    end
  end

  describe '::edit_settings' do
    let(:params) do
      {
        ctc_window: 1,
        vtc_window: 0,
        dirty_param: 'abcd'
      }
    end

    let(:expected_params) do
      subject.send(:sanitize_params, params)
    end

    let(:request_uri) { "#{base_uri}/#{advertisable_eid}/settings" }

    it 'calls the api with the correct params' do
      subject.edit_settings(advertisable_eid, params)
      expect(WebMock).to have_requested(:post, request_uri).with(body: expected_params.to_json)
    end
  end

  describe '::get_valid_segments' do
    let(:request_uri) { "#{base_uri}/#{advertisable_eid}/valid-segments" }

    it 'calls the api with the correct params' do
      subject.get_valid_segments(advertisable_eid)
      expect(WebMock).to have_requested(:get, request_uri).with(query: {})
    end
  end
end
