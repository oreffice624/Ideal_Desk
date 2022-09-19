require "test_helper"

class DesksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get desks_index_url
    assert_response :success
  end

  test "should get show" do
    get desks_show_url
    assert_response :success
  end

  test "should get new" do
    get desks_new_url
    assert_response :success
  end

  test "should get edit" do
    get desks_edit_url
    assert_response :success
  end
end
