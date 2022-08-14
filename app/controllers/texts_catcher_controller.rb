class TextsCatcherController < ActionController::Base
  # before_action :authenticate_user!
  # before_action :correct_user, only: [:new, :create]

  def new
    user_images = UserImage.new
  end

  def create
    user_id = params[:user_id]
    photo = params[:photo]

    TextCatcher::OpticalCharacterRecognition.new(user_id: user_id, photo: photo).perform
  end

end