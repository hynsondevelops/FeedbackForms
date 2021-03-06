class McmTopicsController < ApplicationController
  before_action :set_mcm_topic, only: [:show, :edit, :update, :destroy]
  before_action :requires_logged_in
  # GET /mcm_topics
  # GET /mcm_topics.json
  def index
    @mcm_topics = McmTopic.all.where(user_id: current_user.id)
  end

  # GET /mcm_topics/1
  # GET /mcm_topics/1.json
  def show
    if (current_user.id != @mcm_topic.user_id)
      redirect_to "/mcm_topics"
    end
  end

  # GET /mcm_topics/new
  def new
    @mcm_topic = McmTopic.new
    #@mcm_topic.sentence_scores.build
  end

  # GET /mcm_topics/1/edit
  def edit
    if (current_user.id != @mcm_topic.user_id)
      redirect_to "/mcm_topics"
    end
  end

  # POST /mcm_topics
  # POST /mcm_topics.json
  def create
    @mcm_topic = McmTopic.new(mcm_topic_params)

    respond_to do |format|
      if @mcm_topic.save
        format.html { redirect_to @mcm_topic, notice: 'Mcm topic was successfully created.' }
        format.json { render :show, status: :created, location: @mcm_topic }
      else
        format.html { render :new }
        format.json { render json: @mcm_topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mcm_topics/1
  # PATCH/PUT /mcm_topics/1.json
  def update
    respond_to do |format|
      if @mcm_topic.update(mcm_topic_params)
        format.html { redirect_to @mcm_topic, notice: 'Mcm topic was successfully updated.' }
        format.json { render :show, status: :ok, location: @mcm_topic }
      else
        format.html { render :edit }
        format.json { render json: @mcm_topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mcm_topics/1
  # DELETE /mcm_topics/1.json
  def destroy
    @mcm_topic.destroy
    respond_to do |format|
      format.html { redirect_to mcm_topics_url, notice: 'Mcm topic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mcm_topic
      @mcm_topic = McmTopic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mcm_topic_params
      params.require(:mcm_topic).permit(:topic_name, :user_id, sentence_scores_attributes: [:id, :score, :sentence, :_destroy])
    end

    def requires_logged_in
      if (!user_signed_in?)
        redirect_to "/users/sign_in"
      end
    end
end
