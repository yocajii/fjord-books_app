# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  setup do
    @report = reports(:one)
    @alice = users(:alice)
    @bob = users(:bob)
  end

  test '#editable?' do
    assert_not @report.editable?(@bob)
    assert @report.editable?(@alice)
  end

  test '#created_on' do
    assert_equal '2022/04/24', I18n.localize(@report.created_on)
  end
end
