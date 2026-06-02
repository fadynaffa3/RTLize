require 'test_helper'

class RtlizeTest < ActiveSupport::TestCase
  def setup
    @env = Rails.application.assets
  end

  test "application.css is not transformed" do
    css = @env.find_asset('application.css').source
    assert_equal ".test { left: 1px; }\n", css
  end

  test "application-symlink.rtl.css is RTL-transformed" do
    css = @env.find_asset('application-symlink.rtl.css').source
    assert_equal ".test { right: 1px; }\n", css
  end

  test "sass-importer.rtl.css is RTL-transformed" do
    css = @env.find_asset('sass-importer.rtl.css').source
    assert_equal ".test-1 {\n  right: 10px; }\n\n.test-2 {\n  float: right; }\n", css
  end
end
