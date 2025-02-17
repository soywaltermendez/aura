require 'rails_helper'

RSpec.describe DashboardController, type: :controller do
  let(:user) { create(:user) }

  before { sign_in user }

  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'assigns today entries' do
      old_entry = create(:mood_entry, user: user, created_at: 2.days.ago)
      recent_entry = create(:mood_entry, user: user, created_at: 1.hour.ago)

      get :index
      expect(assigns(:today_entries)).to include(recent_entry)
      expect(assigns(:today_entries)).not_to include(old_entry)
    end

    it 'assigns week entries' do
      old_entry = create(:mood_entry, user: user, created_at: 2.weeks.ago)
      recent_entry = create(:mood_entry, user: user, created_at: 2.days.ago)

      get :index
      expect(assigns(:week_entries)).to include(recent_entry)
      expect(assigns(:week_entries)).not_to include(old_entry)
    end
  end
end
