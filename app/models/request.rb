class Request < ApplicationRecord
  belongs_to :user

  # Validations
  validates :request, presence: true, allow_blank: false
  validates :state, presence: true, allow_blank: false
  validates :status, presence: true, allow_blank: false
  validate :valid_state
  validate :valid_request
  validate :valid_status, on: :update
  # Revisar cuando debo validar que exista un contrato adjunto
  # validates :valid_contract


  private

  def valid_state
    if state != 'new' && state != 'renew' && state != 'lost' && state != 'stolen' &&
      state != 'technical service'
      errors.add(:state, 'invalid state field, must be: new, renew, lost, stolen or technical service')
    end
  end

  def valid_request
    if request != 'bam' && request != 'sim' && request != 'smartphone'
      errors.add(:request, 'invalid request field, must be: sim, bam or smartphone')
    end
  end

  def valid_status
    if status != 'created' && status != 'approval pending' && status != 'rejected' && status != 'accepted' &&
      status != 'canceled' && status != 'in repairs' && status != 'dispatched' && status != 'ready to deliver'
      errors.add(:status, 'invalid status field')
    end
  end


end
