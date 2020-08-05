require "test_helper"

class Applicants::DestroyTest < ActiveSupport::TestCase
  describe "Applicants::Destroy" do
    let(:klazz) { Applicants::Destroy }

    let(:applicant1) { applicants(:one) }

    describe "#call" do
      describe "Given soft_delete = true" do
        subject { klazz.new(applicant: applicant1) }

        it "returns true and record is soft deleted" do
          value(subject.call).must_equal(true)
          record = Applicant.unscoped.find_by(id: applicant1.reload.id)
          value(record.deleted_at).wont_be_nil
        end
      end

      describe "Given soft_delete = false" do
        subject { klazz.new(applicant: applicant1) }

        it "returns true and record is destroyed" do
          value(subject.call).must_equal(true)
          record = Applicant.find_by(id: applicant1.reload.id)
          value(record).must_be_nil
        end
      end
    end
  end
end
