class Lacture < ApplicationRecord
  belongs_to :teacher
  belongs_to :class_room
  has_many :attendances
end
