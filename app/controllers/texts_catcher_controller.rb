class TextsCatcherController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:new, :show]

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

    puts ocr
    puts "*"*100
    if ocr.class == Class
      redirect_to texts_catcher_path(ocr.id)
    else
      flash[:alert] = "#{ocr}"
      redirect_to new_texts_catcher_path
    end
    
  end

  def show
    @ocr = UserImage.find(params[:id])
  end

  private
    def correct_user
      @user_images = current_user.user_images.find_by(id: params[:id])
      redirect_to all_user_images_path if @user_images.nil?
    end
end