class Smartphone < ApplicationRecord
  belongs_to :user, optional: true

  # Validations
  validates :model, presence: true, allow_blank: false
  validates :category, presence: true, allow_blank: false
  validates :imei, presence: true, allow_blank: false, length: { in: 14..16 }
  validates :price, presence: true, allow_blank: false
  validates :state, presence: true, allow_blank: false
  validate :valid_state
  validate :valid_category, on: :create

  private

  def valid_state
   if state != 'new' && state != 'used' && state != 'catalog'
     errors.add(:state, 'Valor del campo Estado inválido, debe ser: new, used or catalog')
   end
  end

  def valid_category
   if category != 'GE' && category != 'EJ' && category != 'VE' && category != 'PT' &&
     category != 'EE' && category != 'OO' && category != 'ALL'
     errors.add(:request, 'valor de campo Categoría inválido, debe ser: GE, EJ, VE, PT, EE, OO o ALL')
   end
  end

end
