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

    describe "#destroy" do
      describe "Given soft_delete = true" do
        subject { applicants(:one) }

        it "returns true and record is soft deleted" do
          value(subject.destroy(soft_delete: true)).must_equal(true)
          record = Applicant.unscoped.find_by(id: subject.reload.id)
          value(record.deleted_at).wont_be_nil
        end
      end
    end
  end
end
