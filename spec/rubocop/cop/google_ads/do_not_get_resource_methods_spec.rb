# frozen_string_literal: true

RSpec.describe RuboCop::Cop::GoogleAds::DoNotGetResourceMethods do
  subject(:cop) { described_class.new(config) }

  let(:config) { RuboCop::Config.new }

  RuboCop::Cop::GoogleAds::DoNotGetResourceMethods::DEPRECATED_GET_METHODS.each do |get_method|
    describe "About ##{get_method}" do
      it "registers an offense when using `##{get_method}` with method chain from client" do
        expect_offense(<<~RUBY)
          client.service.campaign.#{get_method}
                                  #{'^' * get_method.length} Use `GoogleAdsService.search`, instead of get methods.
        RUBY
      end

      it "does not register an offense when using `##{get_method}` method without receiver" do
        expect_no_offenses(<<~RUBY)
          #{get_method}
        RUBY
      end
    end
  end

  it 'does not register an offense when the method contain get, but not google_ads method' do
    expect_no_offenses(<<~RUBY)
      client.service.campaign.get_hoge
    RUBY
  end
end
