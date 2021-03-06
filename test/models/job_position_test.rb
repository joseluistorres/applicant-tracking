require 'test_helper'

class JobPositionTest < ActiveSupport::TestCase
  describe "JobPosition" do
    let(:klazz) { JobPosition }

    let(:fixture_names) {
      %i[
        ror_senior_developer
        ror_junior_developer
      ]
    }

    it "has valid fixtures" do

      fixture_names.each do |fixture_name|
        subject = job_positions(fixture_name)
        subject.validate
        value(subject.errors).must_be_empty
      end
    end
  end
end
