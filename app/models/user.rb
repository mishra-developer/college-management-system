class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable



  self.inheritance_column = :role

  validates :role, presence: true, inclusion: { in: %w[Student Teacher] }
end
