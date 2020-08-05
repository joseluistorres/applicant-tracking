require "test_helper"

class Applicants::NewHTMLTest < ActiveSupport::TestCase
  describe "Applicants::NewHTML" do
    let(:klazz) { Applicants::NewHTML }

    let(:ror_senior_developer) { job_positions(:ror_senior_developer) }

    describe "#model" do
      subject { klazz.new(job_position: ror_senior_developer) }

      it "returns a new instance Applicant" do
        value(subject.model).must_be_instance_of(Applicant)
        value(subject.model.new_record?).must_equal(true)
      end
    end
  end
end
