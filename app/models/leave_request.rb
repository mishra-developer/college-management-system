class LeaveRequest < ApplicationRecord
  has_many :users, class_name: 'User', foreign_key: 'approval_id'
  belongs_to :user

  enum :status, { pending: 0, approved: 1, cancelled: 2 }
  enum :leave_type, {full_day: 0, half_day: 1}
  enum :transport, {College_transport: 0, own_vahicle: 1}

  STATUS_COLORS = {
    'approved' => 'success',
    'pending' => 'warning',
    'cancelled' => 'danger'
  }.freeze

  after_create :send_email_for_approval

  def send_email_for_approval
    UserMailer.send_email_for_approval(self, User.admin_user).deliver_now
  end
end
