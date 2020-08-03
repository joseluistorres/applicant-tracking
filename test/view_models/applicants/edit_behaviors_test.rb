require "test_helper"

class Applicants::EditHTMLBehaviorsTest < ActiveSupport::TestCase
  describe "Applicants::EditHTMLBehaviors" do
    let(:klazz) {
      Class.new do
        include Applicants::EditHTMLBehaviors
      end
    }

    let(:applicant1) { applicants(:one) }

    describe "#index_url" do
      subject { klazz.new(applicant: applicant1) }

      it "returns the expected URL" do
        value(subject.index_url).must_equal(router.applicants_path)
      end
    end

    describe "#back_url" do
      subject { klazz.new(applicant: applicant1) }

      it "returns the expected URL" do
        value(subject.back_url).must_equal(router.job_positions_path)
      end
    end

    describe "#edit_url" do
      subject { klazz.new(applicant: applicant1) }

      it "returns the expected URL" do
        value(subject.edit_url).must_equal(router.edit_applicant_path(applicant1))
      end
    end
  end
end
