class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @notifications = current_user.notifications.unread
  end

  def mark_as_read
    notification = Notification.find(params[:id])
    notification.update(read: true)

    # Respond according to the request format (e.g., HTML redirect, JavaScript, etc.)
    respond_to do |format|
      format.html { redirect_to notifications_path }
      format.js # if you're using AJAX, you might handle this in a .js.erb view
    end
  end
end
