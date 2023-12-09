# spec/controllers/orders_controller_spec.rb

require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  describe 'GET #show' do
    context 'when user is authenticated' do
      let(:user) { create(:user) }
      let!(:order1) { create(:order, user: user) }
      let!(:order2) { create(:order) } # Order belonging to a different user

      before do
        sign_in user
        get :show
      end

      it 'assigns orders of the current user' do
        expect(assigns(:orders)).to include(order1)
        expect(assigns(:orders)).not_to include(order2)
      end

      it 'renders the show template' do
        expect(response).to render_template(:show)
      end
    end

    context 'when user is not authenticated' do
      it 'redirects to sign in page' do
        get :show
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'PATCH #refund' do
    let(:admin_user) { create(:user, admin: true) }
    let(:order) { create(:order) }

    context 'when admin user is authenticated' do
      before do
        sign_in admin_user
        patch :refund, params: { id: order.id }
        order.reload
      end

      it 'updates the order status to refunded' do
        expect(order.status).to eq('refunded')
      end

      it 'redirects to admin_path with a notice' do
        expect(response).to redirect_to(admin_path)
        expect(flash[:notice]).to eq('Order refunded successfully.')
      end
    end

    context 'when non-admin user attempts refund' do
      let(:user) { create(:user) }

      before do
        sign_in user
        patch :refund, params: { id: order.id }
        order.reload
      end

      it 'does not update the order status' do
        expect(order.status).not_to eq('refunded')
      end

      it 'redirects to root_path' do
        expect(response).to redirect_to(root_path)
      end
    end
  end
end
