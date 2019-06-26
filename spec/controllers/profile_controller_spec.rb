describe ProfileController, type: :controller do
  let!(:admin) { create(:admin_user) }
  let(:user) { create(:user) }

  describe '#update' do
    context 'unauthenticated' do
      it 'should return status 302' do
        post :update, params: { id: user.id }

        expect(response).to have_http_status(302)
      end
    end

    context 'authenticated as admin' do
      it 'should update user' do
        new_user = create(:user, active: true, admin: true)
        sign_in admin

        post :update, params: { id: new_user.id, user: { admin: false, active: false } }

        expect(User.find(new_user.id)).to have_attributes(active: false, admin: false)
      end

      it 'should redirect to user_path after update' do
        sign_in admin

        post :update, params: { id: user.id, user: { admin: false, active: false } }

        expect(response).to redirect_to(user_path)
      end
    end
  end
end
