class CreateSecurities < ActiveRecord::Migration[8.0]
  def change
    create_table :securities do |t|
      t.timestamps
      t.string :employee_id
      t.string :shift_timing_form
      t.string :shift_timing_to
    end
  end
end
