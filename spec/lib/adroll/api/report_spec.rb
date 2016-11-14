require 'spec_helper'

describe AdRoll::Api::Report do
  let!(:base_uri) { 'https://api.adroll.com/v1/report' }

  subject { described_class }

  describe '::ad' do
    let(:request_uri) { "#{base_uri}/ad" }
    let(:params) do
      {
        data_format: 'summary',
        ads: %w(abc123 def456)
      }
    end
    let(:query_params) do
      {
        data_format: params[:data_format],
        ads: params[:ads].join(',')
      }
    end

    it 'calls the api with the correct params' do
      subject.ad(params)
      expect(WebMock).to have_requested(:get, request_uri)
        .with(query: query_params)
    end
  end

  describe '::advertisable' do
    let(:request_uri) { "#{base_uri}/advertisable" }
    let(:params) do
      {
        data_format: 'summary',
        advertisables: %w(abc123 def456)
      }
    end
    let(:query_params) do
      {
        data_format: params[:data_format],
        advertisables: params[:advertisables].join(',')
      }
    end

    it 'calls the api with the correct params' do
      subject.advertisable(params)
      expect(WebMock).to have_requested(:get, request_uri)
        .with(query: query_params)
    end
  end

  describe '::campaign' do
    let(:request_uri) { "#{base_uri}/campaign" }
    let(:params) do
      {
        data_format: 'summary',
        campaigns: %w(abc123 def456)
      }
    end
    let(:query_params) do
      {
        data_format: params[:data_format],
        campaigns: params[:campaigns].join(',')
      }
    end

    it 'calls the api with the correct params' do
      subject.campaign(params)
      expect(WebMock).to have_requested(:get, request_uri)
        .with(query: query_params)
    end
  end
end
