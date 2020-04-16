class Api::EntriesController < ApplicationController
  before_action :set_account
  def index
    @entries = @user.entries
    render json: @entries
  end

  def create
    @entry = @user.entries.build(entry_params)
    if @entry.save
      render json: @entry
    else
      render json: { error: "Error creating entry" }
    end
  end

  def show
    @entry = Entry.find(params[:id])
    render json: @entry
  end

  def destroy
    @entry = Entry.find(params[:id])
    @entry.destroy
  end

  private
  def set_user
    @user = User.find(params[:user_id])
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
