module AdRoll
  module Api
    class Report < AdRoll::Api::Service
      class << self
        def ad(campaigns: nil, adgroups: nil, ads: nil, advertisables: nil,
               data_format:, past_days: nil, start_date: nil, end_date: nil, attributions: nil)

          params = {
            campaigns: campaigns,
            adgroups: adgroups,
            ads: ads,
            advertisables: advertisables,
            data_format: data_format,
            past_days: past_days,
            start_date: start_date,
            end_date: end_date,
            attributions: attributions
          }.reject { |_, value| value.nil? }

          call_api(:get, __method__, params)
        end

        def advertisable(campaigns: nil, adgroups: nil, ads: nil, advertisables: nil,
                         data_format:, past_days: nil, start_date: nil, end_date: nil, attributions: nil)

          params = {
            campaigns: campaigns,
            adgroups: adgroups,
            ads: ads,
            advertisables: advertisables,
            data_format: data_format,
            past_days: past_days,
            start_date: start_date,
            end_date: end_date,
            attributions: attributions
          }.reject { |_, value| value.nil? }

          call_api(:get, __method__, params)
        end

        def campaign(campaigns: nil, adgroups: nil, ads: nil, advertisables: nil,
                     data_format:, past_days: nil, start_date: nil, end_date: nil, attributions: nil)

          params = {
            campaigns: campaigns,
            adgroups: adgroups,
            ads: ads,
            advertisables: advertisables,
            data_format: data_format,
            past_days: past_days,
            start_date: start_date,
            end_date: end_date,
            attributions: attributions
          }.reject { |_, value| value.nil? }

          call_api(:get, __method__, params)
        end
      end
    end
  end
end
