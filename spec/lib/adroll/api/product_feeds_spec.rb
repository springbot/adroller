require 'spec_helper'

describe AdRoll::Api::ProductFeeds do
  let!(:base_uri) { 'https://services.adroll.com/api/v1/product_feeds' }

  subject { described_class }

  before(:each) do
    request_uri << "?apikey=#{AdRoll.api_key}"
  end

  describe '::add_feed_config' do
    let!(:request_uri) { "#{base_uri}/add_feed_config" }

    let!(:params) do
      {
        advertisable: 'abc123',
        feed_url: 'https://productfeedurl.com',
        feedtype: 'csv',
        skipfirstrow: true,
        delimiter: ',',
        escapechar: '.',
        quotechar: '"',
        skipinitialspace: true,
        encoding: 'utf-8',
        tag_name: 'wut',
        locale: 'en_US',
        prices_in_locale_format: true
      }
    end

    it 'calls the api with the correct params' do
      subject.add_feed_config(params)
      expect(WebMock).to have_requested(:put, request_uri)
        .with(query: params)
    end
  end

  describe '::autoconfigure' do
    let!(:request_uri) { "#{base_uri}/autoconfigure" }

    let!(:params) do
      {
        advertisable: 'abc123',
        url: 'https://www.url.com'
      }
    end

    it 'calls the api with the correct params' do
      subject.autoconfigure(params)
      expect(WebMock).to have_requested(:post, request_uri)
        .with(body: params)
    end
  end

  describe '::delete_feed_config' do
    let!(:request_uri) { "#{base_uri}/delete_feed_config" }

    let!(:params) do
      {
        feed_config: 'ADSDFDSF234234'
      }
    end

    it 'calls the api with the correct params' do
      subject.delete_feed_config(params)
      expect(WebMock).to have_requested(:delete, request_uri)
        .with(body: params)
    end
  end

  describe '::delete_parser_config' do
    let!(:request_uri) { "#{base_uri}/delete_parser_config" }

    let!(:params) do
      {
        feed_config: 'ADSDFDSF234234',
        key: 'some_key'
      }
    end

    it 'calls the api with the correct params' do
      subject.delete_parser_config(params)
      expect(WebMock).to have_requested(:delete, request_uri)
        .with(body: params)
    end
  end

  describe '::edit_configuration' do
    let!(:request_uri) { "#{base_uri}/edit_configuration" }

    let!(:params) do
      {
        feed_config: 'ASDF1234',
        feed_config_edits: "{ somejson: true }",
        parser_config_edits: "{ anotherjson: false }"
      }
    end

    it 'calls the api with the correct params' do
      subject.edit_configuration(params)
      expect(WebMock).to have_requested(:post, request_uri)
        .with(body: params)
    end
  end

  describe '::edit_feed_config' do
    let!(:request_uri) { "#{base_uri}/edit_feed_config" }

    let!(:params) do
      {
        feed_config: 'ASDF1234',
        key: 'somekey',
        value: 'somevalue'
      }
    end

    it 'calls the api with the correct params' do
      subject.edit_feed_config(params)
      expect(WebMock).to have_requested(:put, request_uri)
        .with(query: params)
    end
  end

  describe '::feed_downloadable' do
    let!(:request_uri) { "#{base_uri}/feed_downloadable" }

    let!(:params) do
      {
        feed_url: 'https://www.url.com'
      }
    end

    it 'calls the api with the correct params' do
      subject.feed_downloadable(params)
      expect(WebMock).to have_requested(:get, request_uri)
        .with(query: params)
    end
  end

  describe '::feed_status' do
    let!(:request_uri) { "#{base_uri}/feed_status" }

    let!(:params) do
      {
        advertisable: 'abc123'
      }
    end

    it 'calls the api with the correct params' do
      subject.feed_status(params)
      expect(WebMock).to have_requested(:get, request_uri)
        .with(query: params)
    end
  end

  describe '::get_feed_config' do
    let!(:request_uri) { "#{base_uri}/get_feed_config" }

    let!(:params) do
      {
        feed_config: 'ASDF1234'
      }
    end

    it 'calls the api with the correct params' do
      subject.get_feed_config(params)
      expect(WebMock).to have_requested(:get, request_uri)
        .with(query: params)
    end
  end

  describe '::get_parser_config' do
    let!(:request_uri) { "#{base_uri}/get_parser_config" }

    let!(:params) do
      {
        feed_config: 'ASDF1234'
      }
    end

    it 'calls the api with the correct params' do
      subject.get_parser_config(params)
      expect(WebMock).to have_requested(:get, request_uri)
        .with(query: params)
    end
  end

  describe '::match_rate' do
    let!(:request_uri) { "#{base_uri}/match_rate" }

    let!(:params) do
      {
        advertisable: 'abc123',
        date: '2018-02-01'
      }
    end

    it 'calls the api with the correct params' do
      subject.match_rate(params)
      expect(WebMock).to have_requested(:get, request_uri)
        .with(query: params)
    end
  end

  describe '::parse_preview' do
    let!(:request_uri) { "#{base_uri}/parse_preview" }

    let!(:params) do
      {
        advertisable: 'abc123',
        parse_prices_in_locale_format: true,
        language_tag: 'en_US',
        parser_configs: '{ somejson: true }',
        product_data: 'a,b,c,d,e,f',
      }
    end

    it 'calls the api with the correct params' do
      subject.parse_preview(params)
      expect(WebMock).to have_requested(:get, request_uri)
        .with(query: params)
    end
  end

  describe '::set_parser_config' do
    let!(:request_uri) { "#{base_uri}/set_parser_config" }

    let!(:params) do
      {
        feed_config: 'ASDF1234',
        key: 'hi',
        is_required: false,
        path: '1',
        attribute: 'text',
        type: 'text',
        regular_expression: 'someregexpattern',
        regular_expression_replace: 'somereplacementstring'
      }
    end

    it 'calls the apo' do
      subject.set_parser_config(params)
      expect(WebMock).to have_requested(:post, request_uri)
    end
  end

  describe '::set_parser_configs' do
    let!(:request_uri) { "#{base_uri}/set_parser_configs" }

    let!(:params) do
      {
        feed_config: 'ASDF1234',
        parser_configs: '{ somejson: true }',
        is_required: false,
        path: 1,
        attribute: 'text',
        regular_expression: 'someregexpattern',
        regular_expression_replace: 'somereplacementstring',
        type: 'text'
      }
    end

    it 'calls the api' do
      subject.set_parser_configs(params)
      expect(WebMock).to have_requested(:post, request_uri)
    end
  end
end
