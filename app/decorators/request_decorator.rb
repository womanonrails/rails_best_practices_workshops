class RequestDecorator < Draper::Decorator
  # delegate :current_page, :total_pages, :limit_value
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  def created_at
    object.created_at.strftime("%d-%m-%Y")
  end
end
