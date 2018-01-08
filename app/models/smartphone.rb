class Smartphone < ApplicationRecord
  belongs_to :sim, optional: true
  has_one :user_record

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
     errors.add(:state, 'invalid request field, must be: new, used or catalog')
   end
  end

  def valid_category
   if category != 'gerente' && category != 'subgerente' && category != 'jefe de venta/vendedor' &&
     category != 'profesional/tecnico' && category != 'empleado/operario' && category != 'multiusuario' &&
     category != 'otro' && category != 'all'
     errors.add(:request, 'invalid category field')
   end
  end

end
