require 'rails_helper'

RSpec.describe AdminController, type: :controller do
  describe 'GET #index' do
    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end

    it 'assigns the correct instance variables' do
      # Mock data for testing
      total_users = 10
      total_sellers = 5
      total_sales = 1000
      listed_merchandise = 500
      active_listings = 8
      sold_listings = 2
      items_listed = 10
      company_profits = total_sales * 0.05
      all_users = create_list(:user, total_users)
      all_listings = create_list(:listing, items_listed)

      allow(User).to receive(:count).and_return(total_users)
      allow(User).to receive_message_chain(:where, :count).and_return(total_sellers)
      allow(Order).to receive_message_chain(:sum).and_return(total_sales)
      allow(Listing).to receive_message_chain(:where, :sum).and_return(listed_merchandise)
      allow(Listing).to receive_message_chain(:where, :count).and_return(active_listings)
      allow(Listing).to receive_message_chain(:where, :count).and_return(sold_listings)
      allow(Listing).to receive(:count).and_return(items_listed)

      get :index

      expect(assigns(:total_users)).to eq(total_users)
      expect(assigns(:total_sellers)).to eq(total_sellers)
      expect(assigns(:total_sales)).to eq(total_sales)
      expect(assigns(:listed_merchandise)).to eq(listed_merchandise)
      expect(assigns(:active_listings)).to eq(active_listings)
      expect(assigns(:sold_listings)).to eq(sold_listings)
      expect(assigns(:items_listed)).to eq(items_listed)
      expect(assigns(:company_profits)).to eq(company_profits)
      expect(assigns(:all_users)).to match_array(all_users)
      expect(assigns(:all_listings)).to match_array(all_listings)
    end
  end
end
