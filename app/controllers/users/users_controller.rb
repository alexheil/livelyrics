class Users::UsersController < ApplicationController

  def index
  end

  def show
    @user = User.friendly.find(params[:id])
  end

end
