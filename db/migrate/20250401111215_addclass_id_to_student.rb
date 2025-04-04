class AddclassIdToStudent < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :class_room_id, :belongs_to
  end
end
