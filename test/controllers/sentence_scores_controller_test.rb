require 'test_helper'

class SentenceScoresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sentence_score = sentence_scores(:one)
  end

  test "should get index" do
    get sentence_scores_url
    assert_response :success
  end

  test "should get new" do
    get new_sentence_score_url
    assert_response :success
  end

  test "should create sentence_score" do
    assert_difference('SentenceScore.count') do
      post sentence_scores_url, params: { sentence_score: { mcm_topic_id: @sentence_score.mcm_topic_id, score: @sentence_score.score, sentence: @sentence_score.sentence } }
    end

    assert_redirected_to sentence_score_url(SentenceScore.last)
  end

  test "should show sentence_score" do
    get sentence_score_url(@sentence_score)
    assert_response :success
  end

  test "should get edit" do
    get edit_sentence_score_url(@sentence_score)
    assert_response :success
  end

  test "should update sentence_score" do
    patch sentence_score_url(@sentence_score), params: { sentence_score: { mcm_topic_id: @sentence_score.mcm_topic_id, score: @sentence_score.score, sentence: @sentence_score.sentence } }
    assert_redirected_to sentence_score_url(@sentence_score)
  end

  test "should destroy sentence_score" do
    assert_difference('SentenceScore.count', -1) do
      delete sentence_score_url(@sentence_score)
    end

    assert_redirected_to sentence_scores_url
  end
end
