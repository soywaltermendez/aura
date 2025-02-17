class MoodEntriesController < ApplicationController
  before_action :authenticate_user!

  def create
    @mood_entry = current_user.mood_entries.build(mood_entry_params)
    @mood_entry.timestamp = Time.current

    if @mood_entry.save
      redirect_to root_path, notice: "¡Estado de ánimo registrado!"
    else
      redirect_to root_path, alert: "No se pudo guardar el registro: #{@mood_entry.errors.full_messages.join(', ')}"
    end
  end

  private

  def mood_entry_params
    params.require(:mood_entry).permit(:mood, :energy_level, activities: [])
  end
end
