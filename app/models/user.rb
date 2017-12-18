class User < ApplicationRecord
  has_many :requests
  has_one :user_record

  # Validations
  validates :name, presence: true, allow_blank: false
  validates :rut, presence: true, allow_blank: false
  validates :occupation, presence: true, allow_blank: false
  validates :email, presence: true, uniqueness: true, allow_blank: false,
  email_format: { message: 'Invalid email format' }
  validates :supervisor, presence: true, allow_blank: false
  validates :supervisor_email, presence: true, allow_blank: false,
  email_format: { message: 'Invalid email format' }
  validates :cost_center, presence: true, allow_blank: false

end
