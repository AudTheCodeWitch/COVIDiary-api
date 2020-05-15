class Api::UsersController < ApplicationController
  # GET api/users
  # This action lists ALL the users in our database
  def index
    users = User.all
    render json: UserSerializer.new(users)
  end

  # POST api/users
  # This action creates a new user, given the provided parameters
  def create
    user = User.create(user_params)
    if user.save
      render json: UserSerializer.new(user)
    else
      render json: { error: "Error creating user" }
    end
  end

  # GET api/users/:id
  # This action shows a specific user, determined by the :id parameter
  def show
    user = User.find(params[:id])
    render json: UserSerializer.new(user)
  end

  # PATCH api/users/:id/
  # This action allows a user to update his or her data.
  def update
    user = User.find(params[:id])
    if user.update(user_params)
      render json: UserSerializer.new(user)
    else
      render json: { error: "Error updating user" }
    end
  end

  # DELETE api/users/:id
  # This action completely removes a user from the database
  # We may want to update this later to also destroy a user's entries
  def destroy
    user = User.find(params[:id])
    user.destroy
  end

  private
  # Determine which parameters to allow from a form submission
  def user_params
    params.require(:user).permit(
        :id,
        :first_name,
        :last_name,
        :email,
        :birth_date,
        :occupation,
        :essential?,
        :isolation_start,
        :isolation_end,
        :about
    )
  end
end
