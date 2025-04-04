class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # enum gender: { male: 0, female: 1 }

  self.inheritance_column = :role

  validates :role, presence: true, inclusion: { in: %w[Student Teacher Parent Transport Security SuperAdmin] }

  after_create :send_welcome_email

  has_many :leave_requests
  belongs_to :parent, optional: true
  has_one_attached :avatar do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]
    attachable.variant :square, resize_to_limit: [200, 200]
    attachable.variant :medium, resize_to_limit: [300, 300]
  end


  scope :admin_user, -> {find_by(role: 'SuperAdmin')}

  def send_welcome_email
    UserMailer.welcome_email(self).deliver_now
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
