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
        DEPRECATED_GET_METHODS = %i[
          get_ad_group_bid_modifier
          get_group_placement_view
          get_campaign_budget
          get_extension_feed_item
          get_customer_manager_link
          get_search_term_view
          get_keyword_plan_ad_group
          get_billing_setup
          get_click_view
          get_shared_criterion
          get_campaign_draft
          get_ad_group_simulation
          get_product_group_view
          get_landing_page_view
          get_campaign_shared_set
          get_keyword_plan_keyword
          get_location_view
          get_custom_interest
          get_merchant_center_link
          get_detail_placement_view
          get_customer_negative_criterion
          get_keyword_plan_campaign
          get_paid_organic_search_term_view
          get_age_range_view
          get_campaign_label
          get_ad_group_audience_view
          get_mobile_app_category_constant
          get_topic_constant
          get_parental_status_view
          get_bidding_strategy
          get_geo_target_constant
          get_ad_parameter
          get_mobile_device_constant
          get_ad_group_ad_asset_view
          get_ad_group_feed
          get_ad_group_criterion_simulation
          get_ad_group_criterion
          get_distance_view
          get_media_file
          get_user_location_view
          get_feed_item_target
          get_carrier_constant
          get_campaign_audience_view
          get_hotel_group_view
          get_feed_item
          get_campaign_criterion_simulation
          get_customer_client
          get_ad_group_label
          get_recommendation
          get_ad_schedule_view
          get_domain_category
          get_keyword_plan_negative_keyword
          get_ad_group_extension_setting
          get_ad
          get_ad_group_ad
          get_keyword_plan
          get_feed_placeholder_view
          get_customer_client_link
          get_mutate_job
          get_dynamic_search_ads_search_term_view
          get_feed_mapping
          get_language_constant
          get_feed
          get_hotel_performance_view
          get_campaign_criterion
          get_campaign_bid_modifier
          get_customer
          get_remarketing_action
          get_ad_group
          get_label
          get_customer_feed
          get_shared_set
          get_customer_extension_setting
          get_account_budget
          get_campaign_feed
          get_gender_view
          get_video
          get_keyword_view
          get_user_list
          get_product_bidding_category_constant
          get_topic_view
          get_asset
          get_campaign_experiment
          get_conversion_action
          get_ad_group_ad_label
          get_change_status
          get_campaign_extension_setting
          get_operating_system_version_constant
          get_ad_group_criterion_label
          get_geographic_view
          get_google_ads_field
          get_campaign
          get_user_interest
          get_shopping_performance_view
          get_expanded_landing_page_view
          get_customer_label
          get_display_keyword_view
          get_managed_placement_view
          get_account_budget_proposal
        ].freeze

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
