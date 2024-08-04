class NotificationsController < ApplicationController
  def index
    notifications = Notification.all
    render json: notifications
  end

  def create
    Rails.logger.info "Received notification request with params: #{notification_params}"

    notification = Notification.new(notification_params)
    if notification.save
      Rails.logger.info "Notification created successfully: #{notification}"
      render json: { status: 'Notification created successfully' }, status: :created
    else
      Rails.logger.error "Failed to create notification: #{notification.errors.full_messages}"
      render json: { errors: notification.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def notification_params
    params.require(:notification).permit(:task_id, :user_id, :details)
  end
end
