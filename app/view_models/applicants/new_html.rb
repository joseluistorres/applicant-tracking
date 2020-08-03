class Applicants::NewHTML
  include BaseViewModel

  def initialize(job_position:)
    @job_position = job_position
  end

  def model
    @model ||= @job_position.applicants.new
  end
end
