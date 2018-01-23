class Request < ApplicationRecord
  belongs_to :user

  # Validations
  validates :request, presence: true, allow_blank: false
  validates :item, presence: true, allow_blank: false
  validates :status, presence: true, allow_blank: false
  validates :model, presence: true, allow_blank: false
  validates :plan, presence: true, allow_blank: false
  validate :valid_item
  validate :valid_request
  validate :valid_status, on: :update
  # Revisar cuando debo validar que exista un contrato adjunto
  # validates :valid_contract


  private

  def valid_request
    if request != 'new' && request != 'renew' && request != 'stolen/lost' &&
      request != 'technical service' && request != 'transfer line' && request != 'release line'
      errors.add(:request, 'invalid state field, must be: transfer line, new, renew, lost, stolen, technical service')
    end
  end

  def valid_item
    if item != 'bam' && item != 'sim' && item != 'smartphone'  && item != 'roaming' &&
      item != 'smartphone line'
      errors.add(:item, 'invalid request field, must be: sim, bam, smartphone or roaming')
    end
  end

  def valid_status
    if status != 'pendiente aprobacion' && status != 'rechazada' && status != 'cancelada' &&
      status != 'pendiente entrega dispositivo' && status != 'pendiente presupuesto' &&
      status != 'en reparaciones' && status != 'disponible para retiro' &&
      status != 'en curso' && status != 'enviado a trabajador' && status != 'finalizada'
      errors.add(:status, 'invalid status field')
    end
  end


end
