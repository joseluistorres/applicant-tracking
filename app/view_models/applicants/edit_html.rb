class Applicants::EditHTML
  include BaseViewModel

  def initialize(applicant:)
    @applicant = applicant
  end

  def index_url
    router.applicants_path
  end

  def back_url
    router.job_positions_path
  end
end
