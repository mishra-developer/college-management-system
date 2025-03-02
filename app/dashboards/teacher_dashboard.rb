require "administrate/base_dashboard"

class TeacherDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    first_name: Field::String,
    last_name: Field::String,
    phone_number: Field::String,
    email: Field::String,
    address: Field::Text,
    date_of_birth: Field::Date,
    designation: Field::String,
    employee_id: Field::String,
    encrypted_password: Field::String,
    experience_years: Field::Number,
    gender: Field::String,
    joining_date: Field::Date,
    qualification: Field::String,
    remember_created_at: Field::DateTime,
    role: Field::String,
    password: Field::Password,
    subject_specialization: Field::String,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    employee_id
    first_name
    email
    designation
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    id
    first_name
    last_name
    email
    phone_number
    address
    date_of_birth
    designation
    employee_id
    experience_years
    gender
    joining_date
    qualification
    role
    subject_specialization
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    first_name
    last_name
    email
    phone_number
    address
    date_of_birth
    employee_id
    gender
    designation
    experience_years
    joining_date
    qualification
    subject_specialization
    password
  ].freeze

  HIDDEN_FIELDS = {
    role: "Teacher"
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

  # Overwrite this method to customize how teachers are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(teacher)
  #   "Teacher ##{teacher.id}"
  # end
end
