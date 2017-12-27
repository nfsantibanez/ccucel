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
    if state != 'new' && state != 'renew' && state != 'stolen/lost' &&
      state != 'technical service'
      errors.add(:state, 'invalid state field, must be: new, renew, lost, stolen or technical service')
    end
  end

  def valid_item
    if request != 'bam' && request != 'sim' && request != 'smartphone'  && request != 'roaming'
      errors.add(:request, 'invalid request field, must be: sim, bam, smartphone or roaming')
    end
  end

  def valid_status
    if status != 'created' && status != 'approval pending' && status != 'rejected' && status != 'accepted' &&
      status != 'canceled' && status != 'in repairs' && status != 'dispatched' && status != 'ready to deliver'
      errors.add(:status, 'invalid status field')
    end
  end


end
