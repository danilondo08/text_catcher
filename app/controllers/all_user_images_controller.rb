class AllUserImagesController < ApplicationController
  before_action :authenticate_user!
  def index
    @all_user_images = UserImage.all
  end
end
