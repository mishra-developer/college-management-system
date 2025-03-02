class CreateTransports < ActiveRecord::Migration[8.0]
  def change
    create_table :transports do |t|
      t.timestamps
      t.string :vehicle_number
      t.string :route
      t.string :type
      t.string :college_id
    end
  end
end
