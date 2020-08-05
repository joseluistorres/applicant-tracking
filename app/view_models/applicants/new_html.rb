class Applicants::NewHTML
  include BaseViewModel

  def initialize(job_position:)
    @job_position = job_position
  end

  def model
    @model ||= applicants.new
  end

  private

  def applicants
    @job_position.applicants
  end
end
