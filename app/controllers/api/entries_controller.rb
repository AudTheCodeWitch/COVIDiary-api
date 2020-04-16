class Api::EntriesController < ApplicationController
  before_action :set_user
  def index
    if @user
      entries = @user.entries
    else
      entries = Entry.all
    end
    options = {
        include: [:user]
    }
    render json: EntrySerializer.new(entries, options)
  end

  def create
    entry = @user.entries.build(entry_params)
    if entry.save
      render json: EntrySerializer.new(entry)
    else
      render json: { error: "Error creating entry" }
    end
  end

  def show
    entry = Entry.find(params[:id])
    options = {
        include: [:user]
    }
    render json: EntrySerializer.new(entry, options)
  end

  def update
    entry = Entry.find(params[:id])
    if entry.update(entry_params)
      render json: EntrySerializer.new(entry)
    else
      render json: { error: "Error updating entry" }
    end

  end

  def destroy
    entry = Entry.find(params[:id])
    entry.destroy
  end

  private
  def set_user
    if params[:user_id]
      @user = User.find(params[:user_id])
    end
  end

  def entry_params
    params.require(:entry).permit(
        :id,
        :user_id,
        :health_rating,
        :symptoms_present?,
        :health_comments,
        :mental_health_rating,
        :mental_health_comments,
        :diary_entry,
        :created_at
    )
  end
end
