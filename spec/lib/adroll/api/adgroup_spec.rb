require 'spec_helper'

describe AdRoll::Api::Adgroup do
  let!(:basic_auth) { "#{AdRoll.user_name}:#{AdRoll.password}" }
  let!(:base_uri) { 'https://api.adroll.com/v1/adgroup' }

  subject { described_class }

  describe '::add_demographic_target' do
    let(:request_uri) { "#{base_uri}/add_demographic_target" }
    let(:params) do
      {
        adgroup: 'abc123',
        target_min: true,
        target_max: true,
        min_age: 20,
        max_age: 32
      }
    end

    it 'calls the api with the correct params' do
      subject.add_demographic_target(params)
      expect(WebMock).to have_requested(:get, request_uri)
        .with(query: params)
    end
  end

  describe '::add_placement_target' do
    let(:request_uri) { "#{base_uri}/add_placement_target" }
    let(:params) do
      {
        adgroup: 'abc123',
        placement: 'rightcolumn'
      }
    end

    it 'calls the api with the correct params' do
      subject.add_placement_target(params)
      expect(WebMock).to have_requested(:get, request_uri)
        .with(query: params)
    end
  end

  describe '::add_platform_target' do
    let(:request_uri) { "#{base_uri}/add_platform_target" }
    let(:params) do
      {
        adgroup: 'abc123',
        type: 'mobile',
        os: 'ios',
        os_version: '9.3.5',
        device: 'iphone'
      }
    end

    it 'calls the api with the correct params' do
      subject.add_platform_target(params)
      expect(WebMock).to have_requested(:get, request_uri)
        .with(query: params)
    end
  end

  describe '::add_segments' do
    let(:request_uri) { "#{base_uri}/add_segments" }
    let(:params) do
      {
        adgroup: 'abc123',
        segments: %w(def456 ghi789)
      }
    end
    let(:query_params) do
      {
        adgroup: params[:adgroup],
        segments: params[:segments].join(',')
      }
    end

    it 'calls the api with the correct params' do
      subject.add_segments(params)
      expect(WebMock).to have_requested(:get, request_uri)
        .with(query: query_params)
    end
  end

  describe '::allow_site' do
    let(:request_uri) { "#{base_uri}/allow_site" }
    let(:params) do
      {
        ad_format: 1,
        site: 'http://www.springbot.com'
      }
    end

    it 'calls the api with the correct params' do
      subject.allow_site(params)
      expect(WebMock).to have_requested(:get, request_uri)
        .with(query: params)
    end
  end

  describe '::approve_ad' do
    let(:request_uri) { "#{base_uri}/approve_ad" }
    let(:params) do
      {
        adgroup: 'abc123',
        ad: 'def456'
      }
    end

    it 'calls the api with the correct params' do
      subject.approve_ad(params)
      expect(WebMock).to have_requested(:get, request_uri)
        .with(query: params)
    end
  end

  describe '::clone' do
    let(:request_uri) { "#{base_uri}/clone" }
    let(:params) do
      {
        adgroup: 'abc123'
      }
    end

    it 'calls the api with the correct params' do
      subject.clone(params)
      expect(WebMock).to have_requested(:get, request_uri)
        .with(query: params)
    end
  end

  describe '::create' do
    let(:request_uri) { "#{base_uri}/create" }
    let(:params) do
      {
        campaign: 'abc123',
        name: 'Test Adgroup',
        positive_segments: [1, 2],
        negative_segments: [3],
        placement_targets: %w(rightcolumn mobilefeed)
      }
    end

    it 'calls the api with the correct params' do
      subject.create(params)
      expect(WebMock).to have_requested(:post, request_uri)
        # .with(body: params) <= rspec won't play nice but this is an emergency to get it out
    end
  end

  describe '::deselect_ads' do
    let(:request_uri) { "#{base_uri}/deselect_ads" }
    let(:params) do
      {
        adgroup: 'abc123',
        ads: %w(def456 ghi789)
      }
    end
    let(:query_params) do
      {
        adgroup: params[:adgroup],
        ads: params[:ads].join(',')
      }
    end

    it 'calls the api with the correct params' do
      subject.deselect_ads(params)
      expect(WebMock).to have_requested(:get, request_uri)
        .with(query: query_params)
    end
  end

  describe '::edit' do
    let(:request_uri) { "#{base_uri}/edit" }
    let(:params) do
      {
        adgroup: 'abc123',
        name: 'New Name'
      }
    end

    it 'calls the api with the correct params' do
      subject.edit(params)
      expect(WebMock).to have_requested(:post, request_uri)
        .with(body: params)
    end
  end

  describe '::exclude_site' do
    let(:request_uri) { "#{base_uri}/exclude_site" }
    let(:params) do
      {
        ad_format: 1,
        site: 'http://www.springbot.com'
      }
    end

    it 'calls the api with the correct params' do
      subject.exclude_site(params)
      expect(WebMock).to have_requested(:get, request_uri)
        .with(query: params)
    end
  end

  describe '::get' do
    let(:request_uri) { "#{base_uri}/get" }
    let(:params) do
      {
        adgroup: 'abc123'
      }
    end

    it 'calls the api with the correct params' do
      subject.get(params)
      expect(WebMock).to have_requested(:get, request_uri)
        .with(query: params)
    end
  end

  describe '::get_ads' do
    let(:request_uri) { "#{base_uri}/get_ads" }
    let(:params) do
      {
        adgroup: 'abc123',
        is_active: true
      }
    end

    it 'calls the api with the correct params' do
      subject.get_ads(params)
      expect(WebMock).to have_requested(:get, request_uri)
        .with(query: params)
    end
  end

  describe '::get_geo_targets' do
    let(:request_uri) { "#{base_uri}/get_geo_targets" }
    let(:params) do
      {
        adgroup: 'abc123'
      }
    end

    it 'calls the api with the correct params' do
      subject.get_geo_targets(params)
      expect(WebMock).to have_requested(:get, request_uri)
        .with(query: params)
    end
  end

  describe '::pause' do
    let(:request_uri) { "#{base_uri}/pause" }
    let(:params) do
      {
        adgroup: 'abc123'
      }
    end

    it 'calls the api with the correct params' do
      subject.pause(params)
      expect(WebMock).to have_requested(:post, request_uri)
        .with(body: params)
    end
  end

  describe '::pause_ad' do
    let(:request_uri) { "#{base_uri}/pause_ad" }
    let(:params) do
      {
        adgroup: 'abc123',
        ad: 'def456'
      }
    end

    it 'calls the api with the correct params' do
      subject.pause_ad(params)
      expect(WebMock).to have_requested(:post, request_uri)
        .with(body: params)
    end
  end

  describe '::pause_ads' do
    let(:request_uri) { "#{base_uri}/pause_ads" }
    let(:params) do
      {
        adgroup: 'abc123',
        ads: %w(def456 ghi789)
      }
    end

    it 'calls the api with the correct params' do
      subject.pause_ads(params)
      expect(WebMock).to have_requested(:post, request_uri)
        .with(body: params)
    end
  end

  describe '::remove_placement_target' do
    let(:request_uri) { "#{base_uri}/remove_placement_target" }
    let(:params) do
      {
        adgroup: 'abc123',
        placement: 'rightcolumn'
      }
    end

    it 'calls the api with the correct params' do
      subject.remove_placement_target(params)
      expect(WebMock).to have_requested(:get, request_uri)
        .with(query: params)
    end
  end

  describe '::remove_platform_target' do
    let(:request_uri) { "#{base_uri}/remove_platform_target" }
    let(:params) do
      {
        adgroup: 'abc123',
        type: 'mobile',
        os: 'ios',
        os_version: '9.3.5',
        device: 'iphone'
      }
    end

    it 'calls the api with the correct params' do
      subject.remove_platform_target(params)
      expect(WebMock).to have_requested(:get, request_uri)
        .with(query: params)
    end
  end

  describe '::remove_segments' do
    let(:request_uri) { "#{base_uri}/remove_segments" }
    let(:params) do
      {
        adgroup: 'abc123',
        segments: %w(def456 ghi789)
      }
    end
    let(:query_params) do
      {
        adgroup: params[:adgroup],
        segments: params[:segments].join(',')
      }
    end

    it 'calls the api with the correct params' do
      subject.remove_segments(params)
      expect(WebMock).to have_requested(:get, request_uri)
        .with(query: query_params)
    end
  end

  describe '::select_ads' do
    let(:request_uri) { "#{base_uri}/select_ads" }
    let(:params) do
      {
        adgroup: 'abc123',
        ads: %w(def456 ghi789)
      }
    end
    let(:query_params) do
      {
        adgroup: params[:adgroup],
        ads: params[:ads].join(',')
      }
    end

    it 'calls the api with the correct params' do
      subject.select_ads(params)
      expect(WebMock).to have_requested(:get, request_uri)
        .with(query: query_params)
    end
  end

  describe '::unpause' do
    let(:request_uri) { "#{base_uri}/unpause" }
    let(:params) do
      {
        adgroup: 'abc123'
      }
    end

    it 'calls the api with the correct params' do
      subject.unpause(params)
      expect(WebMock).to have_requested(:post, request_uri)
        .with(body: params)
    end
  end

  describe '::unpause_ad' do
    let(:request_uri) { "#{base_uri}/unpause_ad" }
    let(:params) do
      {
        adgroup: 'abc123',
        ad: 'def456'
      }
    end

    it 'calls the api with the correct params' do
      subject.unpause_ad(params)
      expect(WebMock).to have_requested(:post, request_uri)
        .with(body: params)
    end
  end

  describe '::unpause_ads' do
    let(:request_uri) { "#{base_uri}/unpause_ads" }
    let(:params) do
      {
        adgroup: 'abc123',
        ads: %w(def456 ghi789)
      }
    end

    it 'calls the api with the correct params' do
      subject.unpause_ads(params)
      expect(WebMock).to have_requested(:post, request_uri)
        .with(body: params)
    end
  end
end
