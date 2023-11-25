require 'rails_helper'

RSpec.describe ListingsController, type: :controller do
  let(:valid_attributes) {
    { name: 'Example Listing', description: 'Some description', price: 100 }
  }

  let(:invalid_attributes) {
    { name: '', description: 'Some description', price: 100 }
  }

  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Listing" do
        expect {
          post :create, params: { listing: valid_attributes }
        }.to change(Listing, :count).by(1)
      end

      it "redirects to the listings page" do
        post :create, params: { listing: valid_attributes }
        expect(response).to redirect_to(listings_path)
      end
    end

    context "with invalid params" do
      it "renders the new template" do
        post :create, params: { listing: invalid_attributes }
        expect(response).to render_template("new")
      end
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      listing = Listing.create! valid_attributes
      get :show, params: { id: listing.to_param }
      expect(response).to be_successful
    end
  end

  # ... other controller actions tests (edit, update, destroy) go here ...
end
