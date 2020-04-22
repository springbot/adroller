require 'spec_helper'

describe AdRoll::Api::Audience do
  let!(:base_uri) { 'https://services.adroll.com/audience/v1' }

  subject { described_class }

  before(:each) do
    request_uri << "?apikey=#{AdRoll.api_key}"
  end

  describe '::get' do
    let(:advertisable_eid) { 'FAKEADVERTISABLEEID' }
    let!(:request_uri) { "#{base_uri}/user_attribute_names/#{advertisable_eid}" }

    let!(:params) do
      {
        first_party: true
      }
    end

    it 'calls the api with the correct params' do
      subject.user_attribute_names(advertisable_eid, params)
      expect(WebMock).to have_requested(:get, request_uri)
        .with(query: params)
    end
  end

  describe '::segments' do
    let(:request_uri) { "#{base_uri}/segments" }
    let(:params) do
      {
        advertiser_id: 'abc123',
        name: 'test segment',
        source_segment_eid: 'segmenteid123'
      }
    end

    context 'when creating' do
      it 'calls the api with the correct params' do
        subject.segments(params)
        expect(WebMock).to have_requested(:post, request_uri)
          .with(body: params)
      end
    end

    context 'when updating' do
      let(:segment_eid) { 'somesegmenteid' }
      let(:request_uri) { "#{base_uri}/segments/#{segment_eid}" }

      it 'calls the api with the correct params' do
        subject.segments(params, segment_eid)
        expect(WebMock).to have_requested(:post, request_uri)
          .with(body: params)
      end
    end
  end

  describe '::crosschannel_lal_segments' do
    let(:request_uri) { "#{base_uri}/crosschannel_lal_segments/valid-segments" }
    let(:params) do
      { advertiser_id: 'abc123' }
    end

    it 'calls the api with the correct params' do
      subject.crosschannel_lal_segments(params)
      expect(WebMock).to have_requested(:get, request_uri)
        .with(query: params)
    end
  end
end
