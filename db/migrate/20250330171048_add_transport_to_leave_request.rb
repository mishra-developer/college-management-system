class AddTransportToLeaveRequest < ActiveRecord::Migration[8.0]
  def change
    add_column :leave_requests, :transport, :integer
  end
end
