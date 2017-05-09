require 'spec_helper'

describe AdRoll::Api::Pixel do
  let!(:base_uri) { 'https://services.adroll.com/api/v1/pixel' }

  subject { described_class }

  describe '::get' do
    let(:request_uri) { "#{base_uri}/get" }
    let(:params) do
      {
        pixel: 'abc123'
      }
    end

    it 'calls the api with the correct params' do
      subject.get(params)
      expect(WebMock).to have_requested(:get, request_uri)
        .with(query: params)
    end
  end

  describe '::get_rules' do
    let(:request_uri) { "#{base_uri}/get_rules" }
    let(:params) do
      {
        pixel: 'abc123'
      }
    end

    it 'calls the api with the correct params' do
      subject.get_rules(params)
      expect(WebMock).to have_requested(:get, request_uri)
        .with(query: params)
    end
  end

  describe '::get_segments' do
    let(:request_uri) { "#{base_uri}/get_segments" }
    let(:params) do
      {
        pixel: 'abc123'
      }
    end

    it 'calls the api with the correct params' do
      subject.get_segments(params)
      expect(WebMock).to have_requested(:get, request_uri)
        .with(query: params)
    end
  end

  describe '::reorder_rules' do
    let(:request_uri) { "#{base_uri}/reorder_rules" }
    let(:params) do
      {
        pixel: 'abc123',
        rules: %w(ghi789 def456)
      }
    end
    let(:query_params) do
      {
        pixel: params[:pixel],
        rules: params[:rules].join(',')
      }
    end

    it 'calls the api with the correct params' do
      subject.reorder_rules(params)
      expect(WebMock).to have_requested(:get, request_uri)
        .with(query: query_params)
    end
  end
end
