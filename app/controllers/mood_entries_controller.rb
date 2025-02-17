class MoodEntriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @mood_entries = current_user.mood_entries.order(created_at: :desc)
  end

  def create
    @mood_entry = current_user.mood_entries.build(mood_entry_params)

    if @mood_entry.save
      redirect_to root_path, notice: t('.success')
    else
      redirect_to root_path, alert: t('.error', errors: @mood_entry.errors.full_messages.join(', '))
    end
  end

  private

  def mood_entry_params
    params.require(:mood_entry).permit(:mood, :energy_level, activities: [])
  end
end
