# frozen_string_literal: true

require 'rubocop'

require_relative 'rubocop/google_ads'
require_relative 'rubocop/google_ads/version'
require_relative 'rubocop/google_ads/inject'

RuboCop::GoogleAds::Inject.defaults!

require_relative 'rubocop/cop/google_ads_cops'
