class RequestsController < ApplicationController
  respond_to :html

  expose_decorated(:request_object, model: :request, attributes: :request_params)
  expose(:offers) { request_object.offers }
  expose_decorated(:requests) { Request.page params[:page] }

  # POST /requests
  def create
    request_object.save
    respond_with(request_object)
  end

  # PATCH/PUT /requests/1
  def update
    request_object.save
    respond_with(request_object)
  end

  # DELETE /requests/1
  def destroy
    request_object.destroy
    respond_with(request_object)
  end

  private
    def request_params
      params.require(:request).permit(:user_id, :title, :description)
    end
end
