module AdRoll
  module Api
    class Advertisable < AdRoll::Api::Service
      def create(name: nil, organization:, set_as_default: false, url: nil, product_name: nil)
        params = {
          name: name,
          organization: organization,
          set_as_default: set_as_default,
          url: url,
          product_name: product_name
        }.reject { |_, value| value.nil? }

        call_api(:post, __method__, params)
      end

      def edit(advertisable:, click_through_conversion_window: nil, name: nil, path_name: nil,
               url: nil, product_name: nil, view_through_conversion_window: nil)

        params = {
          advertisable: advertisable,
          click_through_conversion_window: click_through_conversion_window,
          name: name,
          path_name: path_name,
          url: url,
          product_name: product_name,
          view_through_conversion_window: view_through_conversion_window
        }.reject { |_, value| value.nil? }

        call_api(:put, __method__, params)
      end

      def enable_rollcrawl(advertisable:, url:)
        params = {
          advertisable: advertisable,
          url: url
        }

        call_api(:post, __method__, params)
      end

      def get(advertisable:)
        params = {
          advertisable: advertisable
        }

        call_api(:get, __method__, params)
      end

      def get_adgroups(advertisable:, camp_active: nil, camp_statuses: nil, camp_blacklist_statuses: nil,
                       camp_type: nil, statuses: nil,
                       blacklist_statuses: nil)

        params = {
          advertisable: advertisable,
          camp_active: camp_active,
          camp_statuses: camp_statuses,
          camp_blacklist_statuses: camp_blacklist_statuses,
          camp_type: camp_type,
          statuses: statuses,
          blacklist_statuses: blacklist_statuses
        }.reject { |_, value| value.nil? }

        call_api(:get, __method__, params)
      end

      def get_ads(advertisable:, is_active: nil, statuses: nil, types: nil, width: nil, height: nil)
        params = {
          advertisable: advertisable,
          is_active: is_active,
          statuses: statuses,
          types: types,
          width: width,
          height: height
        }.reject { |_, value| value.nil? }

        call_api(:get, __method__, params)
      end

      def get_ads_fast(advertisable:, is_active: nil, statuses: nil, types: nil, width: nil, height: nil)
        params = {
          advertisable: advertisable,
          is_active: is_active,
          statuses: statuses,
          types: types,
          width: width,
          height: height
        }.reject { |_, value| value.nil? }

        call_api(:get, __method__, params)
      end

      def get_campaigns(advertisable:, is_active: true, statuses: nil, types: nil, blacklist_statuses: nil)
        params = {
          advertisable: advertisable,
          is_active: is_active,
          statuses: statuses,
          blacklist_statues: blacklist_statuses,
          types: types
        }.reject { |_, value| value.nil? }

        call_api(:get, __method__, params)
      end

      def get_coops(advertisable:, filter_active:, coops_active: true)
        params = {
          advertisable: advertisable,
          filter_active: filter_active,
          coops_active: coops_active
        }.reject { |_, value| value.nil? }

        call_api(:get, __method__, params)
      end

      def get_pixel(advertisable:)
        params = {
          advertisable: advertisable
        }

        call_api(:get, __method__, params)
      end

      def get_segments(advertisable:)
        params = {
          advertisable: advertisable
        }

        call_api(:get, __method__, params)
      end
    end
  end
end
