require 'spec_helper'

describe AdRoll::Api::UniversalCampaigns do
  let!(:basic_auth) { "#{AdRoll.user_name}:#{AdRoll.password}" }
  let!(:base_uri) { 'https://services.adroll.com/activate/api/v2' }

  subject { described_class }

  before(:each) do
    request_uri << "?apikey=#{AdRoll.api_key}"
  end

  describe '::adgroup' do
    let!(:request_uri) { "#{base_uri}/adgroup" }

    context 'on GET request' do
      let(:params) do
        {
          eid: 'RANDOMENTITYID',
          campaign_eid: 'CAMPAIGNRANDOMEID'
        }
      end

      it 'calls the API with correct params' do
        subject.adgroup(params, :get)
        expect(WebMock).to have_requested(:get, request_uri)
          .with(query: params)
      end
    end

    context 'on POST request' do
      let(:form_params) do
        {
          ad_type: 'dynamic',
          name: 'some adgroup',
          kpi_metric: 'CPM',
        }
      end

      let(:query_params) do
        {
          campaign_eid: 'SOMECAMPAIGNEID'
        }
      end

      it 'calls the API with correct params' do
        subject.adgroup(form_params, query_params, :post)
        expect(WebMock).to have_requested(:post, request_uri)
          .with(query: query_params, body: form_params.to_json)
      end
    end

    context 'on PUT request' do
      let(:form_params) do
        {
          name: 'be happy',
          kpi_metric: 'CPM',
          status: 'paused'
        }
      end

      let(:query_params) do
        {
          eid: 'SOMEADGROUPEID'
        }
      end

      it 'calls the API with correct params' do
        subject.adgroup(form_params, query_params, :put)
        expect(WebMock).to have_requested(:put, request_uri)
          .with(query: query_params, body: form_params.to_json)
      end

      context 'when there is nil value on kpi goal' do
        let(:form_params) do
          {
            name: 'be happy2',
            kpi_goal: nil
          }
        end

        let(:query_params) do
          {
            eid: 'SOMEADGROUPEID'
          }
        end

        it 'calls the API with correct params' do
          subject.adgroup(form_params, query_params, :put)
          expect(WebMock).to have_requested(:put, request_uri)
            .with(query: query_params, body: form_params.to_json)
        end
      end
    end
  end

  describe '::adgroup_ad' do
    let!(:request_uri) { "#{base_uri}/adgroup_ad" }

    context 'on PUT request' do
      let(:form_params) do
        {
          status: 'paused',
          eid: 'ADGROUPEIDYAY'
        }
      end

      let(:query_params) do
        {
          adgroup_eid: 'ADGROUPEIDYAY',
          ad_eid: 'ADEIDWHATWHAT'
        }
      end

      it 'calls the API with correct params' do
        subject.adgroup_ad(form_params, query_params, :put)
        expect(WebMock).to have_requested(:put, request_uri)
          .with(query: query_params, body: form_params.to_json)
      end
    end
  end

  describe '::campaign' do
    let!(:request_uri) { "#{base_uri}/campaign" }

    context 'on GET request' do
      let(:params) do
        {
          eid: 'CAMPAIGNEIDWAA',
          advertisable_eid: 'ADVERTISABLEEID'
        }
      end

      it 'calls the API with correct params' do
        subject.campaign(params, :get)
        expect(WebMock).to have_requested(:get, request_uri)
          .with(query: params)
      end
    end

    context 'on POST request' do
      let(:form_params) do
        {
          adgroups: [{'ad_type' => 'hihi', 'name' => 'adgroup name'}],
          budget: 5.0,
          currency: 'paused',
          kpi_goal: 2.0,
          kpi_metric: 'CPM',
          name: 'BEST CAMPAIGN'
        }
      end

      let(:query_params) do
        {
          advertisable_eid: 'ADVERTISSSABLEEID'
        }
      end

      it 'calls the API with correct params' do
        subject.campaign(form_params, query_params, :post)
        expect(WebMock).to have_requested(:post, request_uri)
          .with(query: query_params, body: form_params.to_json)
      end
    end

    context 'on PUT request' do
      let(:form_params) do
        {
          budget: '4.5',
          kpi_goal: '1.5',
          kpi_metric: 'CPM',
          status: 'paused'
        }
      end

      let(:query_params) do
        {
          eid: 'SOMEEIDYES'
        }
      end

      it 'calls the API with correct params' do
        subject.campaign(form_params, query_params, :put)
        expect(WebMock).to have_requested(:put, request_uri)
          .with(query: query_params, body: form_params.to_json)
      end
    end
  end
end
