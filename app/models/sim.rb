class Sim < ApplicationRecord
  has_one :user_record
  has_one :bam
  has_one :smarthphone

  # Validations
  validates :phone_number, presence: true, allow_blank: false, length: { in: 8..11 }
  validates :state, presence: true, allow_blank: false
  validate :valid_state


  private

  def valid_state
    if state != 'new' && state != 'used'
      errors.add(:state, 'invalid request field, must be: new or used')
    end
  end

end
