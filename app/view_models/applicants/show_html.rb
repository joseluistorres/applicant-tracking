class Applicants::ShowHTML
  include Applicants::EditHTMLBehaviors

  delegate :first_name,
           :last_name,
           :email,
           :bio,
           to: :@applicant

  def date_applied
    @applicant.date_applied.to_formatted_s(:long)
  end
end
