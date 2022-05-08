# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  setup do
    @alice = create(:user)
    @report = create(:report, user: @alice)
  end

  test '#editable?' do
    bob = create(:user)
    assert_not @report.editable?(bob)
    assert @report.editable?(@alice)
  end

  test '#created_on' do
    @report.created_at = '2022/04/24 10:00'.in_time_zone
    assert_equal '2022/04/24'.to_date, @report.created_on
  end
end
