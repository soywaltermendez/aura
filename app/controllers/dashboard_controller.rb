class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @mood_entry = MoodEntry.new
    @today_entries = current_user.mood_entries.where('timestamp >= ?', Date.today.beginning_of_day)
    @week_entries = current_user.mood_entries.where('timestamp >= ?', 1.week.ago)
  end
end
