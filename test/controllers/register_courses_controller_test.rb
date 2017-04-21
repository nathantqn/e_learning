require 'test_helper'

class RegisterCoursesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get register_courses_new_url
    assert_response :success
  end

  test "should get create" do
    get register_courses_create_url
    assert_response :success
  end

end
