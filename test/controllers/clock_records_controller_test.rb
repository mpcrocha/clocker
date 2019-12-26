require 'test_helper'

class ClockRecordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @clock_record = clock_records(:one)
  end

  test "should get index" do
    get clock_records_url
    assert_response :success
  end

  test "should get new" do
    get new_clock_record_url
    assert_response :success
  end

  test "should create clock_record" do
    assert_difference('ClockRecord.count') do
      post clock_records_url, params: { clock_record: { time: @clock_record.time, type: @clock_record.type, user_id: @clock_record.user_id } }
    end

    assert_redirected_to clock_record_url(ClockRecord.last)
  end

  test "should show clock_record" do
    get clock_record_url(@clock_record)
    assert_response :success
  end

  test "should get edit" do
    get edit_clock_record_url(@clock_record)
    assert_response :success
  end

  test "should update clock_record" do
    patch clock_record_url(@clock_record), params: { clock_record: { time: @clock_record.time, type: @clock_record.type, user_id: @clock_record.user_id } }
    assert_redirected_to clock_record_url(@clock_record)
  end

  test "should destroy clock_record" do
    assert_difference('ClockRecord.count', -1) do
      delete clock_record_url(@clock_record)
    end

    assert_redirected_to clock_records_url
  end
end
