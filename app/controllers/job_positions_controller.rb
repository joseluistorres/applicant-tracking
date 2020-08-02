class JobPositionsController < ApplicationController
  before_action :set_job_position, only: [:show, :edit, :update, :destroy]

  # GET /job_positions
  # GET /job_positions.json
  def index
    @job_positions = JobPosition.all
  end

  # GET /job_positions/1
  # GET /job_positions/1.json
  def show
  end

  # GET /job_positions/new
  def new
    @job_position = JobPosition.new
  end

  # GET /job_positions/1/edit
  def edit
  end

  # POST /job_positions
  # POST /job_positions.json
  def create
    @job_position = JobPosition.new(job_position_params)

    respond_to do |format|
      if @job_position.save
        format.html { redirect_to @job_position, notice: 'Job position was successfully created.' }
        format.json { render :show, status: :created, location: @job_position }
      else
        format.html { render :new }
        format.json { render json: @job_position.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /job_positions/1
  # PATCH/PUT /job_positions/1.json
  def update
    respond_to do |format|
      if @job_position.update(job_position_params)
        format.html { redirect_to @job_position, notice: 'Job position was successfully updated.' }
        format.json { render :show, status: :ok, location: @job_position }
      else
        format.html { render :edit }
        format.json { render json: @job_position.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /job_positions/1
  # DELETE /job_positions/1.json
  def destroy
    @job_position.destroy
    respond_to do |format|
      format.html { redirect_to job_positions_url, notice: 'Job position was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_position
      @job_position = JobPosition.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def job_position_params
      params.fetch(:job_position, {}).permit(:title, :description, :active)
    end
end
