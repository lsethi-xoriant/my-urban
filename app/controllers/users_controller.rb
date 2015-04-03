class UsersController < ApplicationController
	
  def index
    @users = User.all
    render 'index.html.haml'
  end

  def profile
  end
end
