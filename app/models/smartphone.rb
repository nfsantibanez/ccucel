class Smartphone < ApplicationRecord
  belongs_to :sim, optional: true
  has_one :user_record

# Validations
validates :model, presence: true, allow_blank: false
validates :imei, presence: true, allow_blank: false, length: { in: 14..16 }
validates :price, presence: true, allow_blank: false
validates :type, presence: true, allow_blank: false
validate :valid_type
validate :valid_category, on: :create


private

def valid_type
  if type != 'new' && type != 'used'
    errors.add(:type, 'invalid request field, must be: new or used')
  end
end

def valid_category
  if category != 'gerente' && category != 'subgerente' && category != 'jefe venta/vendedor' &&
    category != 'profesional/tecnico' && category != 'empleado/operario' && category != 'multiusuario'
    errors.add(:request, 'invalid category field')
  end
end

end
