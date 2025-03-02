require "administrate/base_dashboard"

class StudentDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    address: Field::Text,
    date_of_birth: Field::Date,
    designation: Field::String,
    email: Field::String,
    encrypted_password: Field::String,
    experience_years: Field::Number,
    first_name: Field::String,
    gender: Field::String,
    last_name: Field::String,
    phone_number: Field::String,
    qualification: Field::String,
    remember_created_at: Field::DateTime,
    reset_password_sent_at: Field::DateTime,
    reset_password_token: Field::String,
    role: Field::String,
    roll_no: Field::String,
    subject_specialization: Field::String,
    password: Field::Password

  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    id
    first_name
    email
    phone_number
    roll_no
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    id
    first_name
    last_name
    email
    phone_number
    gender
    address
    date_of_birth
    password
    designation
    experience_years
    qualification
    role
    roll_no
    subject_specialization
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :first_name,
    :last_name,
    :email,
    :phone_number,
    :date_of_birth,
    :gender,
    :address,
    :designation,
    :roll_no,
    :subject_specialization,
    :qualification,
    :password
    ].freeze
  
  # Hidden fields
  HIDDEN_FIELDS = {
    role: "Student"
    
  }.freeze
  
  # COLLECTION_FILTERS
  # a hash that defines filters that can be used while searching via the search
  # field of the dashboard.
  #
  # For example to add an option to search for open resources by typing "open:"
  # in the search field:
  #
  #   COLLECTION_FILTERS = {
  #     open: ->(resources) { resources.where(open: true) }
  #   }.freeze
  COLLECTION_FILTERS = {}.freeze

  # Overwrite this method to customize how students are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(student)
  #   "Student ##{student.id}"
  # end
end
