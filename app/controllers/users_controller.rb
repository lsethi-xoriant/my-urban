class UsersController < ApplicationController
	
  def index
    @users = User.all
    render 'index1'
  end

  def profile
  end
end
