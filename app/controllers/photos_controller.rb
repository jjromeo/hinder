class PhotosController < ApplicationController
  def index
    @photo = Photo.for_voting(current_user).first
    @latest_chat = ChatRoom.for_user(current_user).last
  end

  def for_voting
    photo = Photo.for_voting(current_user).first
    if photo.present?
      render json: { id: photo.id, image_url: photo.image.url }
    else
      render json: nil
    end
  end

  def new
    @photo = current_user.photos.build
  end

  def create
    @photo = Photo.new(photo_params)

    if @photo.save
      flash[:success] = "Photo added!"
      redirect_to user_path(current_user.id)
    else
      render :new
    end
  end

  def destroy
    Photo.find(params[:id]).destroy
    flash[:success] = "Photo deleted"
    redirect_to user_path(current_user.id)
  end

  private

  def photo_params
    params.require(:photo).permit(:image, :user_id)
  end
end
