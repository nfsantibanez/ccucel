class Plan < ApplicationRecord
  has_one :user_record
  has_many :user
end
