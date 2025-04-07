class CreateLactures < ActiveRecord::Migration[8.0]
  def change
    create_table :lactures do |t|
      t.string :topic, null: false
      t.datetime :start_time, null: false
      t.datetime :end_time, null: false
      t.references :teacher
      t.references :class_room
      t.timestamps
    end
  end
end
