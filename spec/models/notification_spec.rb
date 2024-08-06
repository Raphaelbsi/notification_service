require 'rails_helper'

RSpec.describe Notification, type: :model do
  it { should validate_presence_of(:task_id) }
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:details) }
end
