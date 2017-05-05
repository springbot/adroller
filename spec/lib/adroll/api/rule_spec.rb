require 'spec_helper'

describe AdRoll::Api::Rule do
  let!(:base_uri) { 'https://services.adroll.com/api/v1/rule' }

  subject { described_class }

  describe '::create' do
    let(:request_uri) { "#{base_uri}/create" }
    let(:params) do
      {
        pixel: 'abc123',
        type: 'c',
        order: '2',
        name: 'alpha',
        display_name: 'Alpha',
        pattern: '/checkout/',
        source: 'c'
      }
    end

    it 'calls the api with the correct params' do
      subject.create(params)
      expect(WebMock).to have_requested(:post, request_uri)
        .with(body: params)
    end
  end

  describe '::edit' do
    let(:request_uri) { "#{base_uri}/edit" }
    let(:params) do
      {
        rule: 'abc123',
        order: '2',
        name: 'alpha',
        display_name: 'Alpha',
        pattern: '/checkout/',
        source: 'c'
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
        rule: 'abc123'
      }
    end

    it 'calls the api with the correct params' do
      subject.get(params)
      expect(WebMock).to have_requested(:get, request_uri)
        .with(query: params)
    end
  end

  describe '::get_segments' do
    let(:request_uri) { "#{base_uri}/get_segments" }
    let(:params) do
      {
        rule: 'abc123'
      }
    end

    it 'calls the api with the correct params' do
      subject.get_segments(params)
      expect(WebMock).to have_requested(:get, request_uri)
        .with(query: params)
    end
  end
end
