class ApplicantsController < ApplicationController
  before_action :require_job_position, only: %i[new create]
  before_action :require_applicant, only: %i[show edit update destroy]

  def index
    @view_model = Applicants::IndexHTML.new
  end

  def new
    @view_model = Applicants::NewHTML.new(job_position: @job_position)
    @applicant = @view_model.model
  end

  def create
    service_object = Applicants::Create.new(applicant_params: applicant_params)

    if service_object.call
      redirect_to service_object.model, notice: 'Applicant was successfully created.'
    else
      @applicant = service_object.model
      render :new
    end
  end

  def show
    @view_model = Applicants::ShowHTML.new(applicant: @applicant)
  end

  def edit
    @view_model = Applicants::EditHTML.new(applicant: @applicant)
  end

  def update
    @view_model = Applicants::UpdateHTML.new(applicant: @applicant)

    service_object =
      Applicants::Update.new(
        applicant: @applicant,
        applicant_params: applicant_params)

    if service_object.call
      redirect_to service_object.model, notice: 'Applicant was successfully updated.'
    else
      @applicant = service_object.model
      render :edit
    end
  end

  def destroy
    @view_model = Applicants::IndexHTML.new
    service_object =
      Applicants::Destroy.new(applicant: @applicant)

    if service_object.call
      flash.notice = 'Applicant was successfully deleted.'
    else
      flash.error = 'Applicant could not be deleted.'
    end

    redirect_to @view_model.index_url
  end

  private

  def require_job_position
    job_position = JobPosition.find_by(id: job_position_param)

    if job_position
      @job_position = job_position
    else
      redirect_to(
        { action: :index },
        notice: t("flash.not_found", type: "JobPosition"))
    end
  end

  def require_applicant
    applicant = Applicant.find_by(id: params[:id])

    if applicant
      @applicant = applicant
    else
      redirect_to(
        { action: :index },
        notice: t("flash.not_found", type: "Applicant"))
    end
  end

  def job_position_param
    params[:job_position_id] || params[:applicant][:job_position_id]
  end

  def applicant_params
    params.
      fetch(:applicant, {}).
      permit(
        :first_name,
        :last_name,
        :email,
        :bio,
        :date_applied,
        :job_position_id)
  end
end
