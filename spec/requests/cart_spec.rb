require 'rails_helper'

RSpec.describe "Carts", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/cart/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /add_item" do
    it "returns http success" do
      get "/cart/add_item"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /remove_item" do
    it "returns http success" do
      get "/cart/remove_item"
      expect(response).to have_http_status(:success)
    end
  end

end


RSpec.describe CartController, type: :controller do
  let(:user) { create(:user) }
  let(:listing) { create(:listing) }

  before { sign_in user }

  describe 'GET #show' do
    it 'assigns the user cart' do
      get :show
      expect(assigns(:cart)).to eq(user.cart)
    end

    it 'renders the show template' do
      get :show
      expect(response).to render_template(:show)
    end
  end

  describe 'POST #add_item' do
    it 'adds a listing to the cart' do
      post :add_item, params: { id: listing.id }
      expect(user.cart.listings).to include(listing)
    end

    it 'redirects to cart_path' do
      post :add_item, params: { id: listing.id }
      expect(response).to redirect_to(cart_path)
    end
  end

  describe 'POST #remove_item' do
    before { user.cart.listings << listing }

    it 'removes a listing from the cart' do
      post :remove_item, params: { id: listing.id }
      expect(user.cart.listings).not_to include(listing)
    end

    it 'redirects to cart_path' do
      post :remove_item, params: { id: listing.id }
      expect(response).to redirect_to(cart_path)
    end
  end

  describe 'POST #add_item_to_cart' do
    let(:user) { create(:user) }
    let(:cart) { create(:cart, user: user) }
    let(:listing) { create(:listing) }

    before { sign_in user }

    context 'when cart item exists' do
      let!(:cart_item) { create(:cart_item, cart: cart, listing: listing) }

      it 'increases the quantity of the existing cart item' do
        post :add_item_to_cart, params: { listing_id: listing.id }
        cart_item.reload
        expect(cart_item.quantity).to eq(2)
      end
    end

    context 'when cart item does not exist' do
      it 'creates a new cart item' do
        post :add_item_to_cart, params: { listing_id: listing.id }
        expect(cart.cart_items.count).to eq(1)
        expect(cart.cart_items.first.quantity).to eq(1)
      end
    end
  end

  describe 'POST #checkout' do
    let(:user) { create(:user) }
    let(:cart) { create(:cart, user: user) }
    let(:listing) { create(:listing, user: user) }
    let!(:cart_item) { create(:cart_item, cart: cart, listing: listing) }

    before { sign_in user }

    context 'when cart is not empty' do
      it 'creates an order and marks the listing as sold' do
        post :checkout
        expect(user.orders.count).to eq(1)
        expect(user.orders.first.total).to eq(cart.total_price)
        expect(listing.reload.is_sold).to be_truthy
      end

      it 'creates a notification for the listing owner' do
        expect { post :checkout }.to change(Notification, :count).by(1)
      end

      it 'clears the cart items after checkout' do
        expect { post :checkout }.to change(CartItem, :count).by(-1)
      end

      it 'redirects to user_path with a success notice' do
        post :checkout
        expect(response).to redirect_to(user_path(user.id))
        expect(flash[:notice]).to eq('Thank you for your purchase!')
      end
    end

    context 'when cart is empty' do
      before { cart.cart_items.destroy_all }

      it 'does not create an order or mark the listing as sold' do
        post :checkout
        expect(user.orders.count).to eq(0)
        expect(listing.reload.is_sold).to be_falsy
      end

      it 'redirects to cart_path with an alert' do
        post :checkout
        expect(response).to redirect_to(cart_path)
        expect(flash[:alert]).to eq('Your cart is empty.')
      end
    end

    context 'when checkout fails' do
      before { allow_any_instance_of(Order).to receive(:save!).and_raise(ActiveRecord::RecordInvalid) }

      it 'redirects to cart_path with an alert' do
        post :checkout
        expect(response).to redirect_to(cart_path)
        expect(flash[:alert]).to start_with('Checkout failed:')
      end
    end
  end
end

