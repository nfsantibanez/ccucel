class Bam < ApplicationRecord
  belongs_to :sim
  has_one :user_record

# Validations
validates :model, presence: true, allow_blank: false
validates :imei, presence: true, allow_blank: false, length: { in: 14..16 }
validates :price, presence: true, allow_blank: false
validates :type, presence: true, allow_blank: false
validate :valid_type


private

def valid_type
  if type != 'new' && type != 'used'
    errors.add(:type, 'invalid request field, must be: new or used')
  end
end

end
