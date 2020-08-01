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
  belongs_to :job_position
end
