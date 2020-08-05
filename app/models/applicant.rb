# An Applicant represents a person that has applied for a given
# job position.
#
# @attr first_name [String]
# @attr last_name [String]
# @attr email [String]
# @attr bio [String]
# @attr date_applied [DateTime]
# @attr deleted_at [DateTime] Soft-delete column
class Applicant < ApplicationRecord
  VALID_EMAIL_FORMAT_REGEX =
    /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i.freeze

  belongs_to :job_position
  default_scope { not_deleted }

  validates :first_name,
            presence: true
  validates :last_name,
            presence: true
  validates :email,
            format: {
              with: VALID_EMAIL_FORMAT_REGEX,
              on: [:create, :update]
            }
  validates :bio,
            presence: true

  scope :not_deleted, -> { where(deleted_at: nil) }

  def display_name
    "#{first_name} #{last_name}"
  end

  def destroy(soft_delete: false)
    run_callbacks :destroy do
      if soft_delete
        update_column(:deleted_at, DateTime.now)
      else
        super()
      end
    end
  end
end
