class TextsCatcherController < ActionController::Base
  # before_action :authenticate_user!
  # before_action :correct_user, only: [:new, :create]

  def new
    user_images = UserImage.new
  end

  def create

  end
  
  private

end