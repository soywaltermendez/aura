class JournalEntriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @journal_entries = current_user.journal_entries.order(created_at: :desc)
  end

  def new
    @journal_entry = current_user.journal_entries.build
  end

  def create
    @journal_entry = current_user.journal_entries.build(journal_entry_params)

    if @journal_entry.save
      redirect_to journal_entries_path, notice: t('.success')
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def journal_entry_params
    params.require(:journal_entry).permit(:content, :mood_tag)
  end
end
