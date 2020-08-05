require "test_helper"

class Applicants::UpdateTest < ActiveSupport::TestCase
  describe "Applicants::Update" do
    let(:klazz) { Applicants::Update }

    let(:applicant1) { applicants(:one) }

    describe "#call" do
      describe "Given valid params" do
        let(:applicant_params) {
          {
            first_name: "JoseLuis",
          }
        }

        subject {
          klazz.new(
            applicant: applicant1,
            applicant_params: applicant_params)
        }

        it "returns true" do
          value(subject.call).must_equal(true)
        end
      end

      describe "Given invalid params" do
        let(:applicant_params) {
          {
            email: "wrongemail"
          }
        }

        subject {
          klazz.new(
            applicant: applicant1,
            applicant_params: applicant_params)
        }

        it "returns false" do
          value(subject.call).must_equal(false)
        end
      end
    end

    describe "#model" do
      describe "Given valid params" do
        let(:applicant_params) {
          {
            first_name: "JoseLuis",
          }
        }

        subject {
          klazz.new(
            applicant: applicant1,
            applicant_params: applicant_params)
        }

        it "returns an Applicant" do
          subject.call
          value(subject.model).must_be_instance_of(Applicant)
        end
      end

      describe "Given invalid params" do
        let(:applicant_params) {
          {
            email: "wrongemail"
          }
        }

        subject {
          klazz.new(
            applicant: applicant1,
            applicant_params: applicant_params)
        }

        it "returns Applicant and the error for the bad parameter" do
          subject.call
          value(subject.model).must_be_instance_of(Applicant)
          value(subject.model.errors[:email]).must_equal(["is invalid"])
        end
      end
    end
  end
end
