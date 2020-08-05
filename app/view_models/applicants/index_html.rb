class Applicants::IndexHTML
  include BaseViewModel

  def initialize(base_arel: Applicant.all)
    @base_arel = base_arel
  end

  def listings
    @listings ||= Listing.wrap(@base_arel)
  end

  def index_url
    router.applicants_path
  end

  class Listing
    include BaseViewModel

    delegate :first_name,
             :last_name,
             :email,
             :bio,
             to: :@applicant

    def initialize(applicant)
      @applicant = applicant
    end

    def date_applied
      @applicant.date_applied.to_formatted_s(:long)
    end

    def show_url
      router.applicant_path(@applicant)
    end

    def edit_url
      router.edit_applicant_path(@applicant)
    end

    def delete_url
      router.applicant_path(@applicant)
    end

    def delete_confirmation_message
      "Are you sure you want to delete #{@applicant.display_name}?"
    end
  end
end
