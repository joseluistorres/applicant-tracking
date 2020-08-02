# A JobPosition represents a group of duties and responsibilities for a given
# organization, usually with a defined title and a description.
# A position description is a structured document assigning work to a given
# position as it is expected to be performed.
#
# @attr title [String]
# @attr description [String]
# @attr active [Boolean]
class JobPosition < ApplicationRecord
  has_many :applicants, dependent: :destroy
end
