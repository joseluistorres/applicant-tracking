class Applicants::Destroy
  def initialize(applicant:, soft_delete: true)
    @applicant = applicant
    @soft_delete = soft_delete
  end

  def call
    model.destroy(soft_delete: @soft_delete)
  end

  def model
    @model ||= @applicant
  end
end


