class AddTeacherAttributesToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :employee_id, :string
    add_column :users, :subject_specialization, :string
    add_column :users, :qualification, :string
    add_column :users, :experience_years, :integer
    add_column :users, :designation, :string
    add_column :users, :joining_date, :date
  end
end
