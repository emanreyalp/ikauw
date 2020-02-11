class LibraryController < ApplicationController
  def index
    user = User.find(params.require(:user_id))
    @purchases = user.purchases.active.order_by_expiration

    render json: LibraryContentSerializer.new(@purchases)
  end
end
