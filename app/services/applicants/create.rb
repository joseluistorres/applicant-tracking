# frozen_string_literal: true

class Applicants::Create
  def initialize(applicant_params:)
    @applicant_params = applicant_params
  end

  def call
    model.save
  end

  def model
    @model ||= Applicant.new(@applicant_params)
  end
end


