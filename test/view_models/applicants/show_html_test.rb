require "test_helper"

class Applicants::ShowHTMLTest < ActiveSupport::TestCase
  describe "Applicants::ShowHTML" do
    let(:klazz) { Applicants::ShowHTML }

    let(:applicant1) { applicants(:one) }

    describe "#date_applied" do
      subject { klazz.new(applicant: applicant1) }

      let(:target) {
        applicant1.date_applied.to_formatted_s(:long)
      }

      it "returns the formatted Applicant#date_applied" do
        value(subject.date_applied).must_equal(target)
      end
    end

    describe "#first_name" do
      subject { klazz.new(applicant: applicant1) }

      it "returns the Applicant#first_name" do
        value(subject.first_name).must_equal(applicant1.first_name)
      end
    end

    describe "#last_name" do
      subject { klazz.new(applicant: applicant1) }

      it "returns the Applicant#last_name" do
        value(subject.last_name).must_equal(applicant1.last_name)
      end
    end

    describe "#email" do
      subject { klazz.new(applicant: applicant1) }

      it "returns the Applicant#email" do
        value(subject.email).must_equal(applicant1.email)
      end
    end

    describe "#bio" do
      subject { klazz.new(applicant: applicant1) }

      it "returns the Applicant#bio" do
        value(subject.bio).must_equal(applicant1.bio)
      end
    end
  end
end
