require 'adroll/service'

module AdRoll
  module Api
    class Adgroup < AdRoll::Api::Service
      class << self
        def add_demographic_target(adgroup:, target_min:, min_age:, target_max:, max_age:)
          params = {
            adgroup: adgroup,
            target_min: target_min,
            min_age: min_age,
            target_max: target_max,
            max_age: max_age
          }.reject { |_, value| value.nil? }

          call_api(:get, __method__, params)
        end

        def add_placement_target(adgroup:, placement:)
          params = {
            adgroup: adgroup,
            placement: placement
          }.reject { |_, value| value.nil? }

          call_api(:get, __method__, params)
        end

        def add_platform_target(adgroup:, type:, os:, os_version:, device:)
          params = {
            adgroup: adgroup,
            type: type,
            os: os,
            os_version: os_version,
            device: device
          }.reject { |_, value| value.nil? }

          call_api(:get, __method__, params)
        end

        def add_segments(adgroup:, segments:, is_negative: nil)
          params = {
            adgroup: adgroup,
            segments: segments,
            is_negative: is_negative
          }.reject { |_, value| value.nil? }

          call_api(:get, __method__, params)
        end

        def allow_site(ad_format:, site:)
          params = {
            ad_format: ad_format,
            site: site
          }.reject { |_, value| value.nil? }

          call_api(:get, __method__, params)
        end

        def approve_ad(adgroup:, ad:)
          params = {
            adgroup: adgroup,
            ad: ad
          }.reject { |_, value| value.nil? }

          call_api(:get, __method__, params)
        end

        def clone(adgroup:)
          params = {
            adgroup: adgroup
          }.reject { |_, value| value.nil? }

          call_api(:get, __method__, params)
        end

        def create(campaign:, name: nil, ads: nil, positive_segments: nil, negative_segments: nil,
                   geo_targets: nil, geo_targets_countries: nil, geo_targets_regions: nil)
          params = {
            campaign: campaign,
            name: name,
            ads: ads,
            positive_segments: positive_segments,
            negative_segments: negative_segments,
            geo_targets: geo_targets,
            geo_targets_countries: geo_targets_countries,
            geo_targets_regions: geo_targets_regions
          }.reject { |_, value| value.nil? }

          call_api(:get, __method__, params)
        end

        def deselect_ads(adgroup:, ads:)
          params = {
            adgroup: adgroup,
            ads: ads
          }.reject { |_, value| value.nil? }

          call_api(:get, __method__, params)
        end

        def edit(campaign:, name: nil, status: nil, ads: nil, positive_segments: nil, negative_segments: nil,
                 geo_targets:, geo_targets_countries: nil, geo_targets_regions:)
          params = {
            campaign: campaign,
            name: name,
            status: status,
            ads: ads,
            positive_segments: positive_segments,
            negative_segments: negative_segments,
            geo_targets: geo_targets,
            geo_targets_countries: geo_targets_countries,
            geo_targets_regions: geo_targets_regions
          }.reject { |_, value| value.nil? }

          call_api(:get, __method__, params)
        end

        def exclude_site(ad_format:, site:)
          params = {
            ad_format: ad_format,
            site: site
          }.reject { |_, value| value.nil? }

          call_api(:get, __method__, params)
        end

        def get(adgroup:)
          params = {
            adgroup: adgroup
          }.reject { |_, value| value.nil? }

          call_api(:get, __method__, params)
        end

        def get_ads(adgroup:, is_active: nil, statuses: nil, types: nil, width: nil, height: nil)
          params = {
            adgroup: adgroup,
            is_active: is_active,
            statuses: statuses,
            types: types,
            width: width,
            height: height
          }.reject { |_, value| value.nil? }

          call_api(:get, __method__, params)
        end

        def get_geo_targets(adgroup:)
          params = {
            agroup: adgroup
          }.reject { |_, value| value.nil? }

          call_api(:get, __method__, params)
        end

        def pause(adgroup:)
          params = {
            adgroup: adgroup
          }.reject { |_, value| value.nil? }

          call_api(:post, __method__, params)
        end

        def pause_ad(adgroup:, ad:)
          params = {
            adgroup: adgroup,
            ad: ad
          }.reject { |_, value| value.nil? }

          call_api(:post, __method__, params)
        end

        def pause_ads(adgroup:, ads:)
          params = {
            adgroup: adgroup,
            ads: ads
          }.reject { |_, value| value.nil? }

          call_api(:post, __method__, params)
        end

        def remove_placement_target(adgroup:, placement:)
          params = {
            adgroup: adgroup,
            placement: placement
          }.reject { |_, value| value.nil? }

          call_api(:get, __method__, params)
        end

        def remove_platform_target(adgroup:, type:, os:, os_version:, device:)
          params = {
            adgroup: adgroup,
            type: type,
            os: os,
            os_version: os_version,
            device: device
          }.reject { |_, value| value.nil? }

          call_api(:get, __method__, params)
        end

        def remove_segments(adgroup:, segments:)
          params = {
            adgroup: adgroup,
            segments: segments
          }.reject { |_, value| value.nil? }

          call_api(:get, __method__, params)
        end

        def select_ads(adgroup:, ads:)
          params = {
            adgroup: adgroup,
            ads: ads
          }.reject { |_, value| value.nil? }

          call_api(:get, __method__, params)
        end

        def unpause(adgroup:)
          params = {
            adgroup: adgroup
          }.reject { |_, value| value.nil? }

          call_api(:post, __method__, params)
        end

        def unpause_ad(adgroup:, ad:)
          params = {
            adgroup: adgroup,
            ad: ad
          }.reject { |_, value| value.nil? }

          call_api(:post, __method__, params)
        end

        def unpause_ads(adgroup:, ads:)
          params = {
            adgroup: adgroup,
            ads: ads
          }.reject { |_, value| value.nil? }

          call_api(:post, __method__, params)
        end
      end
    end
  end
end
