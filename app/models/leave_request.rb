class LeaveRequest < ApplicationRecord
  has_many :users, class_name: 'User', foreign_key: 'approval_id'
  belongs_to :user

  enum :status, { pending: 0, approved: 1, cancelled: 2 }
  enum :leave_type, {full_day: 0, half_day: 1}

  STATUS_COLORS = {pending: '3386ff', approved: '086a22', cancelled: '3386ff' }.freeze

  after_create :send_email_for_approval

  def send_email_for_approval
    UserMailer.send_email_for_approval(self, User.admin_user).deliver_now
  end
end
