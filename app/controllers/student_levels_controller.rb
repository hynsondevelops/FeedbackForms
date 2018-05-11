class StudentLevelsController < ApplicationController
  before_action :set_student_level, only: [:show, :edit, :update, :destroy]
  before_action :requires_logged_in

  # GET /student_levels
  # GET /student_levels.json
  def index
    @student_levels = StudentLevel.where(user_id: current_user.id) 
  end

  # GET /student_levels/1
  # GET /student_levels/1.json
  def show
    if (current_user.id != @student_level.user_id)
      redirect_to "/student_levels"
    end
  end

  # GET /student_levels/new
  def new
    @student_level = StudentLevel.new
    @student_level.random_sentences.build
  end

  # GET /student_levels/1/edit
  def edit
    if (current_user.id != @student_level.user_id)
      redirect_to "/student_levels"
    end
  end

  # POST /student_levels
  # POST /student_levels.json
  def create
    @student_level = StudentLevel.new(student_level_params)

    respond_to do |format|
      if @student_level.save
        format.html { redirect_to @student_level, notice: 'Student level was successfully created.' }
        format.json { render :show, status: :created, location: @student_level }
      else
        format.html { render :new }
        format.json { render json: @student_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /student_levels/1
  # PATCH/PUT /student_levels/1.json
  def update
    respond_to do |format|
      if @student_level.update(student_level_params)
        format.html { redirect_to @student_level, notice: 'Student level was successfully updated.' }
        format.json { render :show, status: :ok, location: @student_level }
      else
        format.html { render :edit }
        format.json { render json: @student_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /student_levels/1
  # DELETE /student_levels/1.json
  def destroy
    @student_level.destroy
    respond_to do |format|
      format.html { redirect_to student_levels_url, notice: 'Student level was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_level
      @student_level = StudentLevel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_level_params
      params.require(:student_level).permit(:user_id, :level_name, :generic_text, random_sentences_attributes: [:id, :sentence, :_destroy])
    end

    def requires_logged_in
      if (!user_signed_in?)
        redirect_to "/users/sign_in"
      end
    end

end
