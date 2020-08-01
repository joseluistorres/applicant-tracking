require 'test_helper'

class ApplicantTest < ActiveSupport::TestCase
  describe "Applicant" do
    let(:klazz) { Applicant }

    let(:fixture_names) {
      %i[
        one
        two
      ]
    }

    it "has valid fixtures" do

      fixture_names.each do |fixture_name|
        subject = applicants(fixture_name)
        subject.validate
        value(subject.errors).must_be_empty
      end
    end
  end
end
