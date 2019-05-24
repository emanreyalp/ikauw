class LibraryController < ApplicationController
  def index
    user = User.find(params.require(:user_id))
    @contents = user.contents.with_remaining_time

    render json: LibrarySerializer.new(@contents)
  end
end
