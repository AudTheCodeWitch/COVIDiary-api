class Api::EntriesController < ApplicationController
  # before we call a controller action, call the #set_user private method
  before_action :set_user

  # GET api/users/:user_id/entries OR api/entries
  # This action lists ALL the entries in the database OR all the entries for a given user.
  def index
    # if there is a user in the params, only show their entries.
    # Otherwise, only show the public entries.
    # TODO: edit user entries so they only show private ones if it is the current user
    entries = @user ? @user.entries : Entry.public
    options = {
        include: [:user]
    }
    render json: EntrySerializer.new(entries, options)
  end

  # POST api/users/:user_id/entries
  # This action creates a new entry assigned to a given user
  def create
    entry = @user.entries.build(entry_params)
    if entry.save
      render json: EntrySerializer.new(entry)
    else
      render json: { error: "Error creating entry" }
    end
  end

  # GET api/users/:user_id/entries/:id
  # This action shows a specific entry for a given user
  def show
    entry = Entry.find(params[:id])
    options = {
        include: [:user]
    }
    render json: EntrySerializer.new(entry, options)
  end

  # PATCH api/users/:user_id/entries/:id
  # This action allows a user to update his or her entry.
  def update
    entry = Entry.find(params[:id])
    if entry.update(entry_params)
      render json: EntrySerializer.new(entry)
    else
      render json: { error: "Error updating entry" }
    end

  end

  # DELETE api/users/:user_id/entries/:id
  # This action completely removes an entry from the database
  def destroy
    entry = Entry.find(params[:id])
    entry.destroy
  end

  private
  # This method allows us to find a specific user
  def set_user
    if params[:user_id]
      @user = User.find(params[:user_id])
    end
  end

  # Determine which parameters to allow from a form submission
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
