class PhotosController < ApplicationController
  def index
    matching_photos = Photo.all
    @list_of_photos = matching_photos.order({:created_at => :desc})
    render({ :template => "photo_templates/index" })
  end

  def show
    url_id = params.fetch("path_id")
    matching_photos = Photo.where({ :id => url_id })
    @the_photo = matching_photos.at(0)
    if @the_photo == nil
      redirect_to("/404")
    else
      render({ :template => "photo_templates/show" })
    end
  end

  def create

    input_image = params.fetch("query_image")
    input_caption = params.fetch("query_caption")
    input_owner = params.fetch("query_owner_id")

    a_new_photo = Photo.new
    a_new_photo.image = input_image
    a_new_photo.caption = input_caption
    a_new_photo.owner_id = input_owner

    if a_new_photo.valid?
      a_new_photo.save
    redirect_to("/photos/#{a_new_photo.id}>", { :notice => "Photo created successfully."})
    else
      redirect_to("/photos", { :notice => "Photo failed to create successfully."})
    end
  end

  def destroy
    url_id = params.fetch("path_id")
    matching_photos = Photo.where({ :id => url_id })
    @the_photo = matching_photos.at(0)
    @the_photo.destroy
    redirect_to("/photos", { :notice => "Photo deleted successfully."})
  end
end
