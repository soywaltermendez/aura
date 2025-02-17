require 'rails_helper'

RSpec.describe MoodEntriesController, type: :controller do
  let(:user) { create(:user) }

  before { sign_in user }

  describe 'POST #create' do
    context 'with valid params' do
      let(:valid_attributes) do
        {
          mood: 'happy',
          energy_level: 4,
          activities: %w[trabajo ejercicio]
        }
      end

      it 'creates a new mood entry' do
        expect do
          post :create, params: { mood_entry: valid_attributes }
        end.to change(MoodEntry, :count).by(1)
      end

      it 'redirects to root with success message' do
        post :create, params: { mood_entry: valid_attributes }
        expect(response).to redirect_to(root_path)
        expect(flash[:notice]).to eq('¡Estado de ánimo registrado!')
      end
    end

    context 'with invalid params' do
      let(:invalid_attributes) do
        {
          mood: 'invalid_mood',
          energy_level: 10,
          activities: ['invalid_activity']
        }
      end

      it 'does not create a mood entry' do
        expect do
          post :create, params: { mood_entry: invalid_attributes }
        end.not_to change(MoodEntry, :count)
      end

      it 'redirects to root with error message' do
        post :create, params: { mood_entry: invalid_attributes }
        expect(response).to redirect_to(root_path)
        expect(flash[:alert]).to match(/No se pudo guardar el registro/)
      end
    end
  end
end
