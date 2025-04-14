require "test_helper"

class LibrariesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get libraries_index_url
    assert_response :success
  end

  test "should get new" do
    get libraries_new_url
    assert_response :success
  end

  test "should get edit" do
    get libraries_edit_url
    assert_response :success
  end
end
