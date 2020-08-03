# Common behavior across Edit/Show/Update view models.
module Applicants::EditHTMLBehaviors
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

  def edit_url
    router.edit_applicant_path(@applicant)
  end
end
