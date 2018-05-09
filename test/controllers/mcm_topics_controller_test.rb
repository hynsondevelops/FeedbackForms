require 'test_helper'

class McmTopicsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mcm_topic = mcm_topics(:one)
  end

  test "should get index" do
    get mcm_topics_url
    assert_response :success
  end

  test "should get new" do
    get new_mcm_topic_url
    assert_response :success
  end

  test "should create mcm_topic" do
    assert_difference('McmTopic.count') do
      post mcm_topics_url, params: { mcm_topic: { score: @mcm_topic.score, sentence: @mcm_topic.sentence, user_id: @mcm_topic.user_id } }
    end

    assert_redirected_to mcm_topic_url(McmTopic.last)
  end

  test "should show mcm_topic" do
    get mcm_topic_url(@mcm_topic)
    assert_response :success
  end

  test "should get edit" do
    get edit_mcm_topic_url(@mcm_topic)
    assert_response :success
  end

  test "should update mcm_topic" do
    patch mcm_topic_url(@mcm_topic), params: { mcm_topic: { score: @mcm_topic.score, sentence: @mcm_topic.sentence, user_id: @mcm_topic.user_id } }
    assert_redirected_to mcm_topic_url(@mcm_topic)
  end

  test "should destroy mcm_topic" do
    assert_difference('McmTopic.count', -1) do
      delete mcm_topic_url(@mcm_topic)
    end

    assert_redirected_to mcm_topics_url
  end
end
