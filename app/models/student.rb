class Student < User
  belongs_to :parent, optional: true

  def parent_email
    parent&.email
  end

  def parent_email=(email)
    found_parent = Parent.find_by(email: email)
    if found_parent
      self.parent = found_parent
    else
      errors.add(:parent_email, "not found")
    end
  end
end
