class User < ApplicationRecord
  has_many :requests
  has_one :bam
  has_one :plan
  has_one :smarthphone
  has_one :sim

  # Validations
  validates :name, presence: true, allow_blank: false
  validates :national_id, presence: true, allow_blank: false
  validates :jobtitle, presence: true, allow_blank: false
  validates :email, presence: true, uniqueness: true, allow_blank: true,
  email_format: { message: 'Invalid email format' }
  validates :supervisor, presence: true, allow_blank: true
  validates :supervisor_email, presence: true, allow_blank: true,
  email_format: { message: 'Invalid email format' }
  validates :deptname, presence: true, allow_blank: false
  validates :country, presence: true, allow_black: false
  validates :smartphone_id, :allow_blank => true, :uniqueness => true
  validates :bam_id, :allow_blank => true, :uniqueness => true
  validates :sim_id, :allow_blank => true, :uniqueness => true
  validates :plan_id, :allow_blank => true, :uniqueness => true
end
