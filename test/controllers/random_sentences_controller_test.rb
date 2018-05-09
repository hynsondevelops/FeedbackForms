require 'test_helper'

class RandomSentencesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @random_sentence = random_sentences(:one)
  end

  test "should get index" do
    get random_sentences_url
    assert_response :success
  end

  test "should get new" do
    get new_random_sentence_url
    assert_response :success
  end

  test "should create random_sentence" do
    assert_difference('RandomSentence.count') do
      post random_sentences_url, params: { random_sentence: { sentence: @random_sentence.sentence, student_level_id: @random_sentence.student_level_id } }
    end

    assert_redirected_to random_sentence_url(RandomSentence.last)
  end

  test "should show random_sentence" do
    get random_sentence_url(@random_sentence)
    assert_response :success
  end

  test "should get edit" do
    get edit_random_sentence_url(@random_sentence)
    assert_response :success
  end

  test "should update random_sentence" do
    patch random_sentence_url(@random_sentence), params: { random_sentence: { sentence: @random_sentence.sentence, student_level_id: @random_sentence.student_level_id } }
    assert_redirected_to random_sentence_url(@random_sentence)
  end

  test "should destroy random_sentence" do
    assert_difference('RandomSentence.count', -1) do
      delete random_sentence_url(@random_sentence)
    end

    assert_redirected_to random_sentences_url
  end
end
