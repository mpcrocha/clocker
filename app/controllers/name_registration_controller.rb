class NameRegistrationController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]
  def create
    user = User.find_by_name(params[:name])
    unless user
      user = User.new
      user.name = params[:name]
      user.email = ""
      user.skip_password_validation = true
      user.save
    end
    sign_in('user', user)

    redirect_to home_index_path
  end


end