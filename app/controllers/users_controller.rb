class UsersController < ApplicationController
before_action :set_user, only: %i[ show index ] 

  def index 
  end

  def show 
  end
  
  private 

  def set_user
    @user = current_user
    puts 'yolo'
  end
end 