class PhotosController < ApplicationController
  def show
    @p = Photo.find(params[:id])
    @the_caption = @p.caption
    @the_image_url = @p.source
    @updated_at = @p.updated_at
    render("/photos/show.html.erb")
  end

  def index
    @all_photos = Photo.order({:created_at => :desc})
    render("/photos/index.html.erb")
  end

  def new_form
      render("/photos/new_form.html.erb")
  end

  def create_row
    #the_caption =>"Google Logo"
    #the_image_url => the url of image
    p = Photo.new
    p.source = params["the_image_url"]
    p.caption = params["the_caption"]
    p.save
    redirect_to("/photos") #address on the internet
  end

  def edit_form
    @photo =  Photo.find(params[:id])
    render("/photos/edit_form.html.erb")
  end

  def update_row
    p = Photo.find(params[:id])
    p.caption = params[:the_caption]
    p.source = params[:the_source]
    p.save
    redirect_to :controller => "photos", :action => "show", :id => p.id
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.delete
    redirect_to("/photos")
  end

end
