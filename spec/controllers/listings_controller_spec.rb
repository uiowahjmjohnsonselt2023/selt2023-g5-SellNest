require 'rails_helper'

RSpec.describe ListingsController, type: :controller do
  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new listing and redirects' do
        post :create, params: { listing: { title: 'Charming Apartment', description: 'Spacious and modern', price: 1200 } }
        expect(response).to redirect_to(Listing.last)
        expect(flash[:notice]).to eq('Listing was successfully created.')
      end
    end

    context 'with invalid attributes' do
      it 'does not create a new listing' do
        post :create, params: { listing: { description: 'Spacious and modern', price: 1200 } }
        expect(Listing.count).to eq(0)
      end
    end
  end
end
