class CreateTranspots < ActiveRecord::Migration[8.0]
  def change
    create_table :transpots do |t|
      t.timestamps
      t.string :vehicle_number
      t.string :route
      t.string :type
      t.string :college_id
    end
  end
end
