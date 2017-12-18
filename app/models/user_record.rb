class UserRecord < ApplicationRecord
  belongs_to :smartphone, optional: true
  belongs_to :sim, optional: true
  belongs_to :bam, optional: true
  belongs_to :user
end
