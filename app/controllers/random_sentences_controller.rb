class RandomSentencesController < ApplicationController
  before_action :set_random_sentence, only: [:show, :edit, :update, :destroy]

  # GET /random_sentences
  # GET /random_sentences.json
  def index
    @random_sentences = RandomSentence.all
  end

  # GET /random_sentences/1
  # GET /random_sentences/1.json
  def show
  end

  # GET /random_sentences/new
  def new
    @random_sentence = RandomSentence.new
  end

  # GET /random_sentences/1/edit
  def edit
  end

  # POST /random_sentences
  # POST /random_sentences.json
  def create
    @random_sentence = RandomSentence.new(random_sentence_params)

    respond_to do |format|
      if @random_sentence.save
        format.html { redirect_to @random_sentence, notice: 'Random sentence was successfully created.' }
        format.json { render :show, status: :created, location: @random_sentence }
      else
        format.html { render :new }
        format.json { render json: @random_sentence.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /random_sentences/1
  # PATCH/PUT /random_sentences/1.json
  def update
    respond_to do |format|
      if @random_sentence.update(random_sentence_params)
        format.html { redirect_to @random_sentence, notice: 'Random sentence was successfully updated.' }
        format.json { render :show, status: :ok, location: @random_sentence }
      else
        format.html { render :edit }
        format.json { render json: @random_sentence.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /random_sentences/1
  # DELETE /random_sentences/1.json
  def destroy
    @random_sentence.destroy
    respond_to do |format|
      format.html { redirect_to random_sentences_url, notice: 'Random sentence was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_random_sentence
      @random_sentence = RandomSentence.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def random_sentence_params
      params.require(:random_sentence).permit(:student_level_id, :sentence)
    end
end
