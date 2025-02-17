require 'rails_helper'

RSpec.describe DashboardController, type: :controller do
  let(:user) { create(:user) }

  describe 'GET #index' do
    context 'when user is logged in' do
      before { sign_in user }

      it 'returns success response' do
        get :index
        expect(response).to be_successful
      end

      it 'assigns new mood entry' do
        get :index
        expect(assigns(:mood_entry)).to be_a_new(MoodEntry)
      end

      it 'assigns today entries' do
        create(:mood_entry, user: user, timestamp: 1.hour.ago)
        create(:mood_entry, user: user, timestamp: 2.days.ago)

        get :index
        expect(assigns(:today_entries).count).to eq(1)
      end
    end

    context 'when user is not logged in' do
      it 'redirects to login' do
        get :index
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
