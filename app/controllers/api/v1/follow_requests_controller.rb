class API::V1::FollowRequestsController < ActionController::API
  include Graphiti::Responders

  def index
    follow_requests = FollowRequestResource.all(params)
    respond_with(follow_requests)
  end

  def show
    follow_request = FollowRequestResource.find(params)
    respond_with(follow_request)
  end

  def create
    follow_request = FollowRequestResource.build(params)

    if follow_request.save
      render jsonapi: follow_request, status: 201
    else
      render jsonapi_errors: follow_request
    end
  end

  def update
    follow_request = FollowRequestResource.find(params)

    if follow_request.update_attributes
      render jsonapi: follow_request
    else
      render jsonapi_errors: follow_request
    end
  end

  def destroy
    follow_request = FollowRequestResource.find(params)

    if follow_request.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: follow_request
    end
  end
end
