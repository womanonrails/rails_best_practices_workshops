class OffersController < ApplicationController
  respond_to :html

  expose(:request_object) { Request.where(params[:request_id]).last }
  expose(:offer, attributes: :offer_params)

  # POST /offers
  def create
    offer.save
    respond_with(request_object)
  end

  # PATCH/PUT /offers/1
  def update
    offer.save
    respond_with(offer.request)
  end

  # DELETE /offers/1
  def destroy
    offer.destroy
    respond_with(offer.request)
  end

  private
    def offer_params
      params.require(:offer).permit(:user_id, :message)
    end
end
