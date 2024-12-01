class CreateTeachers < ActiveRecord::Migration[8.0]
  def change
    create_table :teachers do |t|
      t.timestamps
    end
  end
end
