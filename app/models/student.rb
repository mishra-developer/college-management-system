class Student < User
  belongs_to :parent, optional: true
end
