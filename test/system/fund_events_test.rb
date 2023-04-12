require "application_system_test_case"

class FundEventsTest < ApplicationSystemTestCase
  setup do
    @fund_event = fund_events(:one)
  end

  test "visiting the index" do
    visit fund_events_url
    assert_selector "h1", text: "Fund events"
  end

  test "should create fund event" do
    visit fund_events_url
    click_on "New fund event"

    fill_in "Amount", with: @fund_event.Amount
    fill_in "Description", with: @fund_event.description
    fill_in "Title", with: @fund_event.title
    click_on "Create Fund event"

    assert_text "Fund event was successfully created"
    click_on "Back"
  end

  test "should update Fund event" do
    visit fund_event_url(@fund_event)
    click_on "Edit this fund event", match: :first

    fill_in "Amount", with: @fund_event.Amount
    fill_in "Description", with: @fund_event.description
    fill_in "Title", with: @fund_event.title
    click_on "Update Fund event"

    assert_text "Fund event was successfully updated"
    click_on "Back"
  end

  test "should destroy Fund event" do
    visit fund_event_url(@fund_event)
    click_on "Destroy this fund event", match: :first

    assert_text "Fund event was successfully destroyed"
  end
end
