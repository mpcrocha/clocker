require "application_system_test_case"

class ClockRecordsTest < ApplicationSystemTestCase
  setup do
    @clock_record = clock_records(:one)
  end

  test "visiting the index" do
    visit clock_records_url
    assert_selector "h1", text: "Clock Records"
  end

  test "creating a Clock record" do
    visit clock_records_url
    click_on "New Clock Record"

    fill_in "Time", with: @clock_record.time
    fill_in "Type", with: @clock_record.type
    fill_in "User", with: @clock_record.user_id
    click_on "Create Clock record"

    assert_text "Clock record was successfully created"
    click_on "Back"
  end

  test "updating a Clock record" do
    visit clock_records_url
    click_on "Edit", match: :first

    fill_in "Time", with: @clock_record.time
    fill_in "Type", with: @clock_record.type
    fill_in "User", with: @clock_record.user_id
    click_on "Update Clock record"

    assert_text "Clock record was successfully updated"
    click_on "Back"
  end

  test "destroying a Clock record" do
    visit clock_records_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Clock record was successfully destroyed"
  end
end
