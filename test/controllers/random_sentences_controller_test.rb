require 'test_helper'

class RandomSentencesControllerTest < ActionController::TestCase
  setup do
    @student_level = student_levels(:one)
    @random_sentence = random_sentences(:one)
  end

  test "should get index" do
    get :index, params: { student_level_id: @student_level }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { student_level_id: @student_level }
    assert_response :success
  end

  test "should create random_sentence" do
    assert_difference('RandomSentence.count') do
      post :create, params: { student_level_id: @student_level, random_sentence: @random_sentence.attributes }
    end

    assert_redirected_to student_level_random_sentence_path(@student_level, RandomSentence.last)
  end

  test "should show random_sentence" do
    get :show, params: { student_level_id: @student_level, id: @random_sentence }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { student_level_id: @student_level, id: @random_sentence }
    assert_response :success
  end

  test "should update random_sentence" do
    put :update, params: { student_level_id: @student_level, id: @random_sentence, random_sentence: @random_sentence.attributes }
    assert_redirected_to student_level_random_sentence_path(@student_level, RandomSentence.last)
  end

  test "should destroy random_sentence" do
    assert_difference('RandomSentence.count', -1) do
      delete :destroy, params: { student_level_id: @student_level, id: @random_sentence }
    end

    assert_redirected_to student_level_random_sentences_path(@student_level)
  end
end
