class Attendance < ApplicationRecord
  belongs_to :student
  belongs_to :lacture

  enum :status, {present: 0, absent: 1}
  STATUS_COLORS = {
    'present' => 'success',
    'absent' => 'danger'
  }.freeze
end
