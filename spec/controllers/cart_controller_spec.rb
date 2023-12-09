RSpec.describe CartController, type: :controller do
  describe 'POST #add_item' do
    let(:user) { create(:user) }
    let(:listing) { create(:listing) }

    before do
      sign_in user
    end

    it 'adds an item to the cart and redirects' do
      post :add_item, params: { id: listing.id }
      expect(response).to redirect_to(cart_path)
      expect(user.cart.listings).to include(listing)
    end

    context 'when the listing does not exist' do
      it 'handles the error' do
        expect {
          post :add_item, params: { id: -1 }
        }.to_not change(user.cart.listings, :count)
        expect(response).to redirect_to(some_error_path) # Replace with actual path
      end
    end
    describe 'POST #checkout' do
      let(:user) { create(:user) }
      let(:cart) { create(:cart, user: user) }
      let(:listing) { create(:listing) }

      before do
        sign_in user
        cart.listings << listing
      end

      context 'with items in the cart' do
        it 'creates an order and clears the cart' do
          expect {
            post :checkout
          }.to change(Order, :count).by(1)
                                    .and change(user.cart.cart_items, :count).to(0)
          expect(response).to redirect_to(user_path(user.id))
          expect(flash[:notice]).to eq('Thank you for your purchase!')
        end
      end

      context 'with an empty cart' do
        before { user.cart.cart_items.destroy_all }

        it 'redirects to cart path with an alert' do
          post :checkout
          expect(response).to redirect_to(cart_path)
          expect(flash[:alert]).to eq('Your cart is empty.')
        end
      end

      context 'when checkout fails' do
        before do
          allow_any_instance_of(Order).to receive(:save!).and_raise(ActiveRecord::RecordInvalid.new(Order.new))
        end

        it 'redirects to cart path with an error message' do
          post :checkout
          expect(response).to redirect_to(cart_path)
          expect(flash[:alert]).to include('Checkout failed:')
        end

      end
    end
  end
end

