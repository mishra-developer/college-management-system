 class CreateStudents < ActiveRecord::Migration[8.0]
  def change
    create_table :students do |t|
      t.timestamps
      t.string  :qualification
      t.date :from_batch
      t.date :to_batch 
      t.references :parent
    end
  end
end
