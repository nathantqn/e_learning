require 'test_helper'

class TopicScoresControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get topic_scores_create_url
    assert_response :success
  end

end
