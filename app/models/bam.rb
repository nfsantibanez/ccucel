class Bam < ApplicationRecord
  belongs_to :user, optional: true

  # Validations
  validates :model, presence: true, allow_blank: false
  validates :imei, presence: true, allow_blank: false, length: { in: 14..16 }
  validates :price, presence: true, allow_blank: false
  validates :state, presence: true, allow_blank: false
  validate :valid_state

  private

  def valid_state
   if state != 'new' && state != 'used' && state != 'catalog'
     errors.add(:state, 'invalid request field, must be: new, used or catalog')
   end
  end

end
