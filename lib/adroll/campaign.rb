module AdRoll
  module Api
    class Campaign < AdRoll::Api::Service
      def create(advertisable:, budget:, is_retargeting: nil, is_fbx_newsfeed: nil,
                 adgroups: nil, cpc: nil, cpm: nil, start_date: nil, end_date: nil,
                 name: nil, status: nil, max_cpm: nil, networks: nil, is_fb_wca: nil,
                 objective: nil, is_facebook: nil)

        params = {
          advertisable: advertisable,
          budget: budget,
          is_retargeting: is_retargeting,
          is_fbx_newsfeed: is_fbx_newsfeed,
          adgroups: adgroups,
          cpc: cpc,
          cpm: cpm,
          start_date: start_date,
          end_date: end_date,
          name: name,
          status: status,
          max_cpm: max_cpm,
          networks: networks,
          is_fb_wca: is_fb_wca,
          objective: objective,
          is_facebook: is_facebook
        }.reject { |_, value| value.nil? }

        call_api(:post, __method__, params)
      end

      def edit(campaign:, budget: nil, is_retargeting: nil,
               cpc: nil, cpm: nil, start_date: nil, end_date: nil,
               name: nil)

        params = {
          campaign: campaign,
          budget: budget,
          is_retargeting: is_retargeting,
          cpc: cpc,
          cpm: cpm,
          start_date: start_date,
          end_date: end_date,
          name: name
        }.reject { |_, value| value.nil? }

        call_api(:put, __method__, params)
      end

      def get(campaign:)
        params = {
          campaign: campaign
        }.reject { |_, value| value.nil? }

        call_api(:get, __method__, params)
      end

      def get_adgroups(campaign:)
        params = {
          campaign: campaign
        }.reject { |_, value| value.nil? }

        call_api(:get, __method__, params)
      end

      def get_ip_range_exclusions(campaign:)
        params = {
          campaign: campaign
        }.reject { |_, value| value.nil? }

        call_api(:get, __method__, params)
      end

      def pause(campaign:)
        params = {
          campaign: campaign
        }.reject { |_, value| value.nil? }

        call_api(:get, __method__, params)
      end

      def pause_ads(campaign:, ads:)
        params = {
          campaign: campaign,
          ads: ads
        }.reject { |_, value| value.nil? }

        call_api(:get, __method__, params)
      end

      def unpause(campaign:)
        params = {
          campaign: campaign
        }.reject { |_, value| value.nil? }

        call_api(:get, __method__, params)
      end

      def unpause_ads(campaign:, ads:)
        params = {
          campaign: campaign,
          ads: ads
        }.reject { |_, value| value.nil? }

        call_api(:get, __method__, params)
      end
    end
  end
end
