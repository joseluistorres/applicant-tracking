# frozen_string_literal: true

class Applicants::Update
  def initialize(applicant:, applicant_params:)
    @applicant = applicant
    @applicant_params = applicant_params
  end

  def call
    model.update(@applicant_params)
  end

  def model
    @model ||= @applicant
  end
end


