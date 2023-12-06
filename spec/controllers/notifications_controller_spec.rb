require 'rails_helper'

RSpec.describe NotificationsController, type: :controller do
  describe "GET #index" do
    it "assigns @notifications" do
      user = FactoryBot.create(:user)
      sign_in user
      notification = FactoryBot.create(:notification, user: user)
      get :index
      expect(assigns(:notifications)).to eq([notification])
    end
  end

  describe "PATCH #mark_as_read" do
    it "marks the notification as read" do
      user = FactoryBot.create(:user)
      sign_in user
      notification = FactoryBot.create(:notification, user: user, read: false)
      patch :mark_as_read, params: { id: notification.id }
      notification.reload
      expect(notification.read).to be_truthy
    end
  end
end
