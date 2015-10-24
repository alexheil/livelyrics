class Users::UsersController < ApplicationController

  def leaderboard
    @users = User.all
  end

  def show
    @user = User.friendly.find(params[:id])
  end

end
