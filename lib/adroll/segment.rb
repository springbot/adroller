module AdRoll
  module Api
    class Segment < AdRoll::Api::Service
      class << self
        def edit(segment: , conversion_value: nil, duration: nil)
          params = {
            segment: segment,
            conversion_value: conversion_value,
            duration: duration
          }.reject { |_, value| value.nil? }

          call_api(:post, __method__, params)
        end

        def get(segment:)
          params = {
            segment: segment
          }.reject { |_, value| value.nil? }

          call_api(:get, __method__, params)
        end
      end
    end
  end
end
