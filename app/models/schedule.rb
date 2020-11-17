class Schedule < ApplicationRecord
  belongs_to :plan
  
  validates :start_time, presence: true
  validates :category, length: { maximum: 20 }
  validates :destination, presence: true, length: { maximum: 100 }
  validates :memo, length: { maximum: 250 }
  validates :day, presence: true, length: { in: 1..7 }
end
