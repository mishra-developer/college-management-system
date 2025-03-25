class CreateLeaveRequests < ActiveRecord::Migration[8.0]
  def change
    create_table :leave_requests do |t|
      t.date :form_date
      t.date :to_date
      t.text :reason
      t.integer :leave_type, default: 0
      t.integer :request_id
      t.references :user
      t.references :approval, foreign_key: { to_table: :users }
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
