require 'spec_helper'

describe AdRoll::Api::Advertisable do
  let!(:base_uri) { 'https://services.adroll.com/api/v1/advertisable' }

  subject { described_class }

  before(:each) do
    request_uri << "?apikey=#{AdRoll.api_key}"
  end

  describe '::create' do
    let!(:request_uri) { "#{base_uri}/create" }

    let!(:params) do
      {
        name: 'name',
        organization: 'abc123',
        set_as_default: true,
        url: 'https://url.com',
        product_name: 'product_name',
        country_code: 'US'
      }
    end

    let!(:escaped_params) do
      params[:url] = CGI.escape(params[:url])
      params[:set_as_default] = 'true'
      params
    end

    it 'calls the api with the correct params' do
      subject.create(params)
      expect(WebMock).to have_requested(:post, request_uri)
        .with(body: escaped_params)
    end
  end

  describe '::edit' do
    let!(:request_uri) { "#{base_uri}/edit" }

    let!(:params) do
      {
        advertisable: 'xyz456',
        country_code: 'US',
        is_twitter_syncing: false,
        twitter_handle: ''
      }
    end

    it 'calls the api with the correct params' do
      subject.edit(params)
      expect(WebMock).to have_requested(:post, request_uri)
        .with(body: params)
    end
  end

  describe '::enable_rollcrawl' do
    let!(:request_uri) { "#{base_uri}/enable_rollcrawl" }

    let!(:params) do
      {
        advertisable: 'xyz456',
        url: 'https://url.com/product_feed.json'
      }
    end

    it 'calls the api with the correct params' do
      subject.enable_rollcrawl(params)
      expect(WebMock).to have_requested(:post, request_uri)
        .with(body: params)
    end
  end

  describe '::get' do
    let!(:request_uri) { "#{base_uri}/get" }

    let!(:params) do
      {
        advertisable: 'xyz456'
      }
    end

    it 'calls the api with the correct params' do
      subject.get(params)
      expect(WebMock).to have_requested(:get, request_uri)
        .with(query: params)
    end
  end

  describe '::get_adgroups' do
    let!(:request_uri) { "#{base_uri}/get_adgroups" }

    let!(:params) do
      {
        advertisable: 'xyz456',
        statuses: %w(admin_review admin_paused).join(',')
      }
    end

    it 'calls the api with the correct params' do
      subject.get_adgroups(params)
      expect(WebMock).to have_requested(:get, request_uri)
        .with(query: params)
    end
  end

  describe '::get_adgroups_fast' do
    let!(:request_uri) { "#{base_uri}/get_adgroups_fast" }

    let!(:params) do
      {
        advertisable: 'xyz456',
        statuses: %w(admin_review admin_paused)
      }
    end
    let(:query_params) do
      {
        advertisable: params[:advertisable],
        statuses: params[:statuses].join(',')
      }
    end

    it 'calls the api with the correct params' do
      subject.get_adgroups_fast(params)
      expect(WebMock).to have_requested(:get, request_uri)
        .with(query: query_params)
    end
  end

  describe '::get_ads' do
    let!(:request_uri) { "#{base_uri}/get_ads" }

    let!(:params) do
      {
        advertisable: 'xyz456',
        width: 300,
        height: 300
      }
    end

    it 'calls the api with the correct params' do
      subject.get_ads(params)
      expect(WebMock).to have_requested(:get, request_uri)
        .with(query: params)
    end
  end

  describe '::get_ads_fast' do
    let!(:request_uri) { "#{base_uri}/get_ads_fast" }

    let!(:params) do
      {
        advertisable: 'xyz456',
        width: 300,
        height: 300
      }
    end

    it 'calls the api with the correct params' do
      subject.get_ads_fast(params)
      expect(WebMock).to have_requested(:get, request_uri)
        .with(query: params)
    end
  end

  describe '::get_campaigns' do
    let!(:request_uri) { "#{base_uri}/get_campaigns" }

    let!(:params) do
      {
        advertisable: 'xyz456'
      }
    end

    it 'calls the api with the correct params' do
      subject.get_campaigns(params)
      expect(WebMock).to have_requested(:get, request_uri)
        .with(query: params)
    end
  end

  describe '::get_campaigns_fast' do
    let!(:request_uri) { "#{base_uri}/get_campaigns_fast" }

    let!(:params) do
      {
        advertisable: 'xyz456'
      }
    end

    it 'calls the api with the correct params' do
      subject.get_campaigns_fast(params)
      expect(WebMock).to have_requested(:get, request_uri)
        .with(query: params)
    end
  end

  describe '::get_coops' do
    let!(:request_uri) { "#{base_uri}/get_coops" }

    let!(:params) do
      {
        advertisable: 'xyz456',
        filter_active: false,
        coops_active: false
      }
    end

    it 'calls the api with the correct params' do
      subject.get_coops(params)
      expect(WebMock).to have_requested(:get, request_uri)
        .with(query: params.merge(filter_active: 'false',
                                  coops_active: 'false'))
    end
  end

  describe '::get_pixel' do
    let!(:request_uri) { "#{base_uri}/get_pixel" }

    let!(:params) do
      {
        advertisable: 'xyz456'
      }
    end

    it 'calls the api with the correct params' do
      subject.get_pixel(params)
      expect(WebMock).to have_requested(:get, request_uri)
        .with(query: params)
    end
  end

  describe '::get_segments' do
    let!(:request_uri) { "#{base_uri}/get_segments" }

    let!(:params) do
      {
        advertisable: 'xyz456'
      }
    end

    it 'calls the api with the correct params' do
      subject.get_segments(params)
      expect(WebMock).to have_requested(:get, request_uri)
        .with(query: params)
    end
  end

  describe '::set_source' do
    let!(:request_uri) { "#{base_uri}/set_source" }

    let!(:params) do
      {}
    end

    it 'calls the api with the correct params' do
      subject.set_source(params)
      expect(WebMock).to have_requested(:post, request_uri)
        .with(query: params)
    end
  end
end
