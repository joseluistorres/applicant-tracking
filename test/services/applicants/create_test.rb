require "test_helper"

class Applicants::CreateTest < ActiveSupport::TestCase
  describe "Applicants::Create" do
    let(:klazz) { Applicants::Create }

    let(:ror_senior_developer) { job_positions(:ror_senior_developer) }

    describe "#call" do
      describe "Given valid params" do
        let(:applicant_params) {
          {
            first_name: "Johnny",
            last_name: "Torres",
            email: "jtorres@somewhere.com",
            bio: "something random",
            date_applied: DateTime.now,
            job_position_id: ror_senior_developer.id
          }
        }

        subject { klazz.new(applicant_params: applicant_params) }

        it "returns true" do
          value(subject.call).must_equal(true)
        end
      end

      describe "Given invalid params" do
        let(:applicant_params) { {} }

        subject { klazz.new(applicant_params: applicant_params) }

        it "returns false" do
          value(subject.call).must_equal(false)
        end
      end
    end
  end
end
