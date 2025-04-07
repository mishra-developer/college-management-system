class CreateAttendances < ActiveRecord::Migration[8.0]
  def change
    create_table :attendances do |t|
      t.references :student
      t.references :lacture
      t.integer :status, default: 0
      t.date :date
      t.timestamps
    end
  end
end
