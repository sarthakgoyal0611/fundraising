require "test_helper"

class FundEventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fund_event = fund_events(:one)
  end

  test "should get index" do
    get fund_events_url
    assert_response :success
  end

  test "should get new" do
    get new_fund_event_url
    assert_response :success
  end

  test "should create fund_event" do
    assert_difference("FundEvent.count") do
      post fund_events_url, params: { fund_event: { Amount: @fund_event.Amount, description: @fund_event.description, title: @fund_event.title } }
    end

    assert_redirected_to fund_event_url(FundEvent.last)
  end

  test "should show fund_event" do
    get fund_event_url(@fund_event)
    assert_response :success
  end

  test "should get edit" do
    get edit_fund_event_url(@fund_event)
    assert_response :success
  end

  test "should update fund_event" do
    patch fund_event_url(@fund_event), params: { fund_event: { Amount: @fund_event.Amount, description: @fund_event.description, title: @fund_event.title } }
    assert_redirected_to fund_event_url(@fund_event)
  end

  test "should destroy fund_event" do
    assert_difference("FundEvent.count", -1) do
      delete fund_event_url(@fund_event)
    end

    assert_redirected_to fund_events_url
  end
end
