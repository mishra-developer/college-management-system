require "administrate/base_dashboard"

class ParentDashboard < Administrate::BaseDashboard
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
    first_name: Field::String,
    gender: Field::String,
    last_name: Field::String,
    phone_number: Field::String,
    qualification: Field::String,
    role: Field::String,
    students: Field::HasMany,

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
   last_name
   email
  date_of_birth
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    id
    address
    date_of_birth
    designation
    email
    first_name
    gender
    last_name
    phone_number
    students
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    address
    date_of_birth
    designation
    email
    first_name
    gender
    last_name
    phone_number
    qualification
    password
    students
  ].freeze

  HIDDEN_FIELDS = {
    role: "Parent"
  }.freeze

  # COLLECTION_FILTERS
  # a hash that defines filters that can be used while searching via the search
  # field of the dashboard.
  #
  # For example to add an option to search for open resources by typing "open:"
  # in the search field:
  #
    COLLECTION_FILTERS = {
      open: ->(resources) { resources.where(open: true) }
    }.freeze
  COLLECTION_FILTERS = {}.freeze

  # Overwrite this method to customize how parents are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(parent)
  #   parent.id
  # end
end
