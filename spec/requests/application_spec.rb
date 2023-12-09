require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  describe '#after_sign_in_path_for' do
    let(:user) { create(:user) }

    it 'redirects to the root path after sign-in' do
      expect(controller.after_sign_in_path_for(user)).to eq(root_path)
    end
  end
end
