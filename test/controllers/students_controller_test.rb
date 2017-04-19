require 'test_helper'

class StudentsControllerTest < ActionDispatch::IntegrationTest
  test "should get homepage" do
    get students_homepage_url
    assert_response :success
  end

end
