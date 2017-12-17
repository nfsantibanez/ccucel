class Sim < ApplicationRecord
  has_one :user_record
  has_one :bam
  has_one :smarthphone

# Validations
validates :phone_number, presence: true, allow_blank: false, length: { in: 8..11 }
validates :type, presence: true, allow_blank: false
validate :valid_type


private

def valid_type
  if type != 'new' && type != 'used'
    errors.add(:type, 'invalid request field, must be: new or used')
  end
end

end
