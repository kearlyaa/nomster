class PhotosController < ApplicationController
  
  before_action :authenticate_user!

  def create

  end

    def destroy
    @photo = Photo.find(params[:id])

    if @photo.user != current_user
      return render text: 'Not Allowed', status: :forbidden
    end

    @photo.destroy
    
    redirect_to user_path(@photo.user_id)
  end

  private

  def photo_params
    params.require(:photo).permit(:caption, :place_id)
  end

end
