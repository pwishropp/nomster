class PhotosController < ApplicationController
    before_action :authenticate_user!
  
   def create
    @place = Place.find(params[:place_id])
    @place.photos.create(photo_params.merge(user: current_user))
   if @place.invalid?
      flash[:error] = '<strong>Could not save</strong> the data you entered is invalid.'
   end
    redirect_to place_path(@place)
   end
  
   private
  
   def photo_params
    params.require(:photo).permit(:caption, :picture)
   end
  end