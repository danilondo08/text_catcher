class TextsCatcherController < ApplicationController
  before_action :authenticate_user!
  # before_action :correct_user, only: [:new, :create]

  def index
    @user_images = current_user.user_images.all
  end

  def new
    user_images = UserImage.new
  end

  def create
    user_id = params[:user_id]
    photo = params[:photo]

    ocr = TextCatcher::OpticalCharacterRecognition.new(user_id: user_id, photo: photo).perform

    if ocr == false
      flash[:alert] = "Error"
      redirect_to new_texts_catcher_path
    else
      redirect_to texts_catcher_path(ocr.id)
    end
    
  end

  def show
    @ocr = UserImage.find(params[:id])
  end

end