require 'spec_helper'

describe AdRoll::Api::Campaign do
  let!(:base_uri) { 'https://services.adroll.com/api/v1/campaign' }

  subject { described_class }

  before(:each) do
    request_uri << "?apikey=#{AdRoll.api_key}"
  end

  describe '::create' do
    let(:request_uri) { "#{base_uri}/create" }
    let(:params) do
      {
        advertisable: 'abc123',
        budget: '7.00',
        ui_budget_daily: 'false'
      }
    end

    it 'calls the api with the correct params' do
      subject.create(params)
      expect(WebMock).to have_requested(:post, request_uri)
        .with(body: params)
    end
  end

  describe '::clone' do
    let(:request_uri) { "#{base_uri}/clone" }
    let(:params) do
      {
        campaign: 'abc123'
      }
    end

    it 'calls the api with the correct params' do
      subject.clone(params)
      expect(WebMock).to have_requested(:post, request_uri)
        .with(body: params)
    end
  end

  describe '::edit' do
    let(:request_uri) { "#{base_uri}/edit" }
    let(:params) do
      {
        campaign: 'abc123',
        ui_budget_daily: 'false'
      }
    end

    it 'calls the api with the correct params' do
      subject.edit(params)
      expect(WebMock).to have_requested(:put, request_uri)
        .with(body: params)
    end
  end

  describe '::get' do
    let(:request_uri) { "#{base_uri}/get" }
    let(:params) do
      {
        campaign: 'abc123'
      }
    end

    it 'calls the api with the correct params' do
      subject.get(params)
      expect(WebMock).to have_requested(:get, request_uri)
        .with(query: params)
    end
  end

  describe '::get_adgroups' do
    let(:request_uri) { "#{base_uri}/get_adgroups" }
    let(:params) do
      {
        campaign: 'abc123'
      }
    end

    it 'calls the api with the correct params' do
      subject.get_adgroups(params)
      expect(WebMock).to have_requested(:get, request_uri)
        .with(query: params)
    end
  end

  describe '::get_ip_range_exclusions' do
    let(:request_uri) { "#{base_uri}/get_ip_range_exclusions" }
    let(:params) do
      {
        campaign: 'abc123'
      }
    end

    it 'calls the api with the correct params' do
      subject.get_ip_range_exclusions(params)
      expect(WebMock).to have_requested(:get, request_uri)
        .with(query: params)
    end
  end

  describe '::pause' do
    let(:request_uri) { "#{base_uri}/pause" }
    let(:params) do
      {
        campaign: 'abc123'
      }
    end

    it 'calls the api with the correct params' do
      subject.pause(params)
      expect(WebMock).to have_requested(:get, request_uri)
        .with(query: params)
    end
  end

  describe '::pause_ads' do
    let(:request_uri) { "#{base_uri}/pause_ads" }
    let(:params) do
      {
        campaign: 'abc123',
        ads: %w(def456 ghi789)
      }
    end
    let(:query_params) do
      {
        campaign: params[:campaign],
        ads: params[:ads].join(',')
      }
    end

    it 'calls the api with the correct params' do
      subject.pause_ads(params)
      expect(WebMock).to have_requested(:get, request_uri)
        .with(query: query_params)
    end
  end

  describe '::unpause' do
    let(:request_uri) { "#{base_uri}/unpause" }
    let(:params) do
      {
        campaign: 'abc123'
      }
    end

    it 'calls the api with the correct params' do
      subject.unpause(params)
      expect(WebMock).to have_requested(:get, request_uri)
        .with(query: params)
    end
  end

  describe '::unpause_ads' do
    let(:request_uri) { "#{base_uri}/unpause_ads" }
    let(:params) do
      {
        campaign: 'abc123',
        ads: %w(def456 ghi789)
      }
    end
    let(:query_params) do
      {
        campaign: params[:campaign],
        ads: params[:ads].join(',')
      }
    end

    it 'calls the api with the correct params' do
      subject.unpause_ads(params)
      expect(WebMock).to have_requested(:get, request_uri)
        .with(query: query_params)
    end
  end
end
