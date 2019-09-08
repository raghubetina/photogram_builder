class API::V1::PhotosController < ActionController::API
  include Graphiti::Responders

  def index
    photos = PhotoResource.all(params)
    respond_with(photos)
  end

  def show
    photo = PhotoResource.find(params)
    respond_with(photo)
  end

  def create
    photo = PhotoResource.build(params)

    if photo.save
      render jsonapi: photo, status: 201
    else
      render jsonapi_errors: photo
    end
  end

  def update
    photo = PhotoResource.find(params)

    if photo.update_attributes
      render jsonapi: photo
    else
      render jsonapi_errors: photo
    end
  end

  def destroy
    photo = PhotoResource.find(params)

    if photo.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: photo
    end
  end
end
