class RandomSentencesController < ApplicationController
  before_action :set_random_sentences
  before_action :set_random_sentence, only: [:show, :edit, :update, :destroy]

  # GET student_levels/1/random_sentences
  def index
    @random_sentences = @student_level.random_sentences
  end

  # GET student_levels/1/random_sentences/1
  def show
  end

  # GET student_levels/1/random_sentences/new
  def new
    @random_sentence = @student_level.random_sentences.build
  end

  # GET student_levels/1/random_sentences/1/edit
  def edit
  end

  # POST student_levels/1/random_sentences
  def create
    @random_sentence = @student_level.random_sentences.build(random_sentence_params)

    if @random_sentence.save
      redirect_to([@random_sentence.student_level, @random_sentence], notice: 'Random sentence was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT student_levels/1/random_sentences/1
  def update
    if @random_sentence.update_attributes(random_sentence_params)
      redirect_to([@random_sentence.student_level, @random_sentence], notice: 'Random sentence was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE student_levels/1/random_sentences/1
  def destroy
    @random_sentence.destroy

    redirect_to student_level_random_sentences_url(@student_level)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_random_sentences
      @student_level = StudentLevel.find(params[:student_level_id])
    end

    def set_random_sentence
      @random_sentence = @student_level.random_sentences.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def random_sentence_params
      params.require(:random_sentence).permit(:student_level_id, :sentence)
    end
end
