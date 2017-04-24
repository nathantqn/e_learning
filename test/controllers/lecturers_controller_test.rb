require 'test_helper'

class LecturersControllerTest < ActionDispatch::IntegrationTest
  test "should get homepage" do
    get lecturers_homepage_url
    assert_response :success
  end

end
