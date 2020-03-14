# frozen_string_literal: true

# TODO: when finished, run `rake generate_cops_documentation` to update the docs
module RuboCop
  module Cop
    module GoogleAds
      # This cop enforces to use GoogleAdsService.search to retrive resource.
      #
      # @example
      #   # bad
      #   client.service.resource.get_resource
      #
      #   # good
      #   client.service.google_ads.search(customer_id, query_to_retrive_resource)
      #
      class DoNotGetResourceMethods < Cop
        deprecated_get_methods_file_path = File.open(File.expand_path('deprecated_get_methods.yml', __dir__))
        DEPRECATED_GET_METHODS = YAML.parse(deprecated_get_methods_file_path).to_ruby.map(&:to_sym).freeze
        MSG = 'Use `GoogleAdsService.search`, instead of get methods.'

        def on_send(node)
          receiver, method_name = *node
          return unless receiver && DEPRECATED_GET_METHODS.include?(method_name)

          add_offense(node, location: :selector)
        end
      end
    end
  end
end
