class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @mood_entry = current_user.mood_entries.build
    @today_entries = current_user.mood_entries
                                 .where(created_at: Time.current.beginning_of_day..)
                                 .order(created_at: :desc)
    @week_entries = current_user.mood_entries
                                .where(created_at: 1.week.ago..)
                                .order(created_at: :desc)
  end
end
