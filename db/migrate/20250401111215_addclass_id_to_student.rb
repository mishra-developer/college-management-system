class AddclassIdToStudent < ActiveRecord::Migration[8.0]
  def change
    add_reference :users, :class_room, foreign_key: true
  end
end
