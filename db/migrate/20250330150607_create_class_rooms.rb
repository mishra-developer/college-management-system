class CreateClassRooms < ActiveRecord::Migration[8.0]
  def change
    create_table :class_rooms do |t|
      t.string :stream
      t.integer :NumberOFStudent
      t.integer :year

      t.timestamps
    end
  end
end
