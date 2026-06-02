require 'rtlize/helpers'
require 'rtlize/rtl_processor'

module Rtlize
  class Railtie < ::Rails::Railtie
    config.rtlize = ActiveSupport::OrderedOptions.new
    config.rtlize.rtl_selector = Rtlize.rtl_selector
    config.rtlize.rtl_locales  = Rtlize.rtl_locales

    initializer "rtlize.railtie", :after => "sprockets.environment" do |app|
      if defined?(Sprockets)
        # Sprockets 4+ (Rails 7+) uses a callable with call(input) -> { data: }
        # Sprockets 3 used register_postprocessor with a class having render(context, locals)
        # We support Sprockets 4+ only.
        Sprockets.register_postprocessor 'text/css', Rtlize::RtlProcessor
      end

      Rtlize.rtl_selector = config.rtlize.rtl_selector
      Rtlize.rtl_locales  = config.rtlize.rtl_locales
    end
  end
end
