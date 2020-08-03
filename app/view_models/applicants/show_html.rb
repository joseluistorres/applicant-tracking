class Applicants::ShowHTML
  include BaseViewModel

  delegate :first_name,
           :last_name,
           :email,
           :bio,
           to: :@applicant

  def initialize(applicant:)
    @applicant = applicant
  end

  def date_applied
    @applicant.date_applied.to_formatted_s(:long)
  end

  def index_url
    router.applicants_path
  end

  def edit_url
    router.edit_applicant_path(@applicant)
  end
end
