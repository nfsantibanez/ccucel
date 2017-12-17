class Request < ApplicationRecord
  belongs_to :user

  # Validations
  validates :request, presence: true, allow_blank: false
  validates :type, presence: true, allow_blank: false
  validates :status, presence: true, allow_blank: false
  validates :valid_type, :valid_request
  validate :valid_status, on: :update
  # Revisar cuando debo validar que exista un contrato adjunto
  # validates :valid_contract


  private

  def valid_type
    if type != 'new' && type != 'renew' && type != 'lost' && type != 'stolen' &&
      type != 'technical service'
      errors.add(:type, 'invalid type field, must be: new, renew, lost, stolen or technical service')
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
