class SentenceScoresController < ApplicationController
  before_action :set_sentence_score, only: [:show, :edit, :update, :destroy]

  # GET /sentence_scores
  # GET /sentence_scores.json
  def index
    @sentence_scores = SentenceScore.all
  end

  # GET /sentence_scores/1
  # GET /sentence_scores/1.json
  def show
  end

  # GET /sentence_scores/new
  def new
    @sentence_score = SentenceScore.new
  end

  # GET /sentence_scores/1/edit
  def edit
  end

  # POST /sentence_scores
  # POST /sentence_scores.json
  def create
    @sentence_score = SentenceScore.new(sentence_score_params)

    respond_to do |format|
      if @sentence_score.save
        format.html { redirect_to @sentence_score, notice: 'Sentence score was successfully created.' }
        format.json { render :show, status: :created, location: @sentence_score }
      else
        format.html { render :new }
        format.json { render json: @sentence_score.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sentence_scores/1
  # PATCH/PUT /sentence_scores/1.json
  def update
    respond_to do |format|
      if @sentence_score.update(sentence_score_params)
        format.html { redirect_to @sentence_score, notice: 'Sentence score was successfully updated.' }
        format.json { render :show, status: :ok, location: @sentence_score }
      else
        format.html { render :edit }
        format.json { render json: @sentence_score.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sentence_scores/1
  # DELETE /sentence_scores/1.json
  def destroy
    @sentence_score.destroy
    respond_to do |format|
      format.html { redirect_to sentence_scores_url, notice: 'Sentence score was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sentence_score
      @sentence_score = SentenceScore.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sentence_score_params
      params.require(:sentence_score).permit(:mcm_topic_id, :score, :sentence)
    end
end
