class AddRequestToOffers < ActiveRecord::Migration
  def change
    add_reference :offers, :request, index: true
  end
end
