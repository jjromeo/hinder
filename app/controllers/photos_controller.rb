class PhotosController < ApplicationController
  def index
    @photo = Photo.for_voting(current_user).first
  end

  def for_voting
    user = User.find(params[:user_id])
    photos = Photo.for_voting(user)
    render json: photos
  end

  def new
    @photo = current_user.photos.build
  end

  def create
    @photo = current_user.photos.build(photo_params)

    if @photo.save!
      redirect_to user_path(current_user.id)
    else
      render :new
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:image)
  end
end
