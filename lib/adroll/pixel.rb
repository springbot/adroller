module AdRoll
  module Api
    class Pixel < AdRoll::Api::Service
      def get(pixel:)
        params = {
          pixel: pixel
        }.reject { |_, value| value.nil? }

        call_api(:get, __method__, params)
      end

      def get_rules(pixel:)
        params = {
          pixel: pixel
        }.reject { |_, value| value.nil? }

        call_api(:get, __method__, params)
      end

      def get_segments(pixel:)
        params = {
          pixel: pixel
        }.reject { |_, value| value.nil? }

        call_api(:get, __method__, params)
      end

      def reorder_rules(pixel:, rules:)
        params = {
          pixel: pixel,
          rules: rules
        }.reject { |_, value| value.nil? }

        call_api(:get, __method__, params)
      end
    end
  end
end
