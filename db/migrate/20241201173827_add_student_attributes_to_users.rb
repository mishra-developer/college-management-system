class AddStudentAttributesToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :roll_no, :string
    add_column :users, :phone_number, :string
    add_column :users, :date_of_birth, :date
    add_column :users, :gender, :string
    add_column :users, :address, :text
  end
end
