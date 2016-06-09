module AdRoll
  module Api
    class Rule < AdRoll::Api::Service
      class << self
        def create(pixel:, type:, order:, name:, display_name: nil, pattern:, source: nil)
          params = {
            pixel: pixel,
            type: type,
            order: order,
            name: name,
            display_name: display_name,
            pattern: pattern,
            source: source
          }.reject { |_, value| value.nil? }

          call_api(:post, __method__, params)
        end

        def edit(rule:, order:, name:, display_name:, pattern:, source:)
          params = {
            rule: rule,
            order: order,
            name: name,
            display_name: display_name,
            pattern: pattern,
            source: source
          }.reject { |_, value| value.nil? }

          call_api(:put, __method__, params)
        end

        def get(rule:)
          params = {
            rule: rule
          }.reject { |_, value| value.nil? }

          call_api(:get, __method__, params)
        end

        def get_segments(rule:)
          params = {
            rule: rule
          }.reject { |_, value| value.nil? }

          call_api(:get, __method__, params)
        end
      end
    end
  end
end
