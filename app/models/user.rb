class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # enum gender: { male: 0, female: 1 }

  self.inheritance_column = :role

  validates :role, presence: true, inclusion: { in: %w[Student er Parent Transport Security SuperAdmin] }

  after_create :send_welcome_email

  def send_welcome_email
    UserMailer.welcome_email(self).deliver_now
  end
end
