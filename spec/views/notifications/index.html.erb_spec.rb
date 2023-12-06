require 'rails_helper'

RSpec.describe "notifications/index", type: :view do
  it "displays all the notifications" do
    assign(:notifications, [
      FactoryBot.create(:notification, content: "Notification 1"),
      FactoryBot.create(:notification, content: "Notification 2")
    ])

    render

    expect(rendered).to include("Notification 1")
    expect(rendered).to include("Notification 2")
  end
end
