require 'spec_helper'

describe AdRoll::Api::Graphql do
  let!(:basic_auth) { "#{AdRoll.user_name}:#{AdRoll.password}" }
  let!(:base_uri) { 'https://services.adroll.com/reporting/api/v1' }

  subject { described_class }

  before(:each) do
    request_uri << "?apikey=#{AdRoll.api_key}"
  end

  describe '::query' do
    let!(:request_uri) { "#{base_uri}/query" }

    let(:query) { 'query MyFirstQuery { advertisable { forUser { eid name campaigns { eid name metrics(start: "2017-06-01", end: "2017-06-30") { summary { impressions clicks cpc cpa } } } } } }' }

    let!(:params) do
      {
        query: query
      }
    end

    it 'calls the api with the correct params' do
      subject.query(params)
      expect(WebMock).to have_requested(:post, request_uri).with(body: params)
    end
  end
end
