class ClassRoom < ApplicationRecord
  has_many :students
  has_many :lactures
  enum :year, {first_year: 0, second_year: 1, third_year: 2, fourth_yaar: 3}
end
