class UserRecord < ApplicationRecord
  belongs_to :smartphone
  belongs_to :sim
  belongs_to :bam
  belongs_to :user
end
