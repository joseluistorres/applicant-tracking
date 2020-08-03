require "test_helper"

class Applicants::IndexHTMLTest < ActiveSupport::TestCase
  describe "Applicants::IndexHTML" do
    let(:klazz) { Applicants::IndexHTML }

    let(:applicant1) { applicants(:one) }

    describe "#listings" do
      subject { klazz.new(base_arel: [applicant1]) }

      it "returns an Array of Applicants::IndexHTML::Listings" do
        results = subject.listings
        value(results).wont_be_empty
        value(results.first).must_be_instance_of(klazz::Listing)
      end
    end

    describe "#date_applied" do
      subject { klazz.new(base_arel: [applicant1]) }

      let(:target) {
        applicant1.date_applied.to_formatted_s(:long)
      }

      it "returns the formatted Applicant#date_applied" do
        results = subject.listings
        listing = results.first
        value(listing.date_applied).must_equal(target)
      end
    end

    describe "#show_url" do
      subject { klazz.new(base_arel: [applicant1]) }

      it "returns the expected URL" do
        results = subject.listings
        listing = results.first
        value(listing.show_url).must_equal(router.applicant_path(applicant1))
      end
    end

    describe "#edit_url" do
      subject { klazz.new(base_arel: [applicant1]) }

      it "returns the expected URL" do
        results = subject.listings
        listing = results.first
        value(listing.edit_url).must_equal(router.edit_applicant_path(applicant1))
      end
    end

    describe "#delete_url" do
      subject { klazz.new(base_arel: [applicant1]) }

      it "returns the expected URL" do
        results = subject.listings
        listing = results.first
        value(listing.delete_url).must_equal(router.applicant_path(applicant1))
      end
    end

    describe "#delete_confirmation_message" do
      subject { klazz.new(base_arel: [applicant1]) }
      let(:target) {
        "Are you sure you want to delete #{applicant1.display_name}?"
      }

      it "returns the expected URL" do
        results = subject.listings
        listing = results.first
        value(listing.delete_confirmation_message).must_equal(target)
      end
    end
  end
end
