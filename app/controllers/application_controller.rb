class ApplicationController < ActionController::Base
  before_action :set_user
  include Authentication
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  def set_user
    @user = current_user
    puts 'yolo'
  end

end
