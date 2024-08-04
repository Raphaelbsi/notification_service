class Notification < ApplicationRecord
  validates :task_id, :user_id, :details, presence: true
end
