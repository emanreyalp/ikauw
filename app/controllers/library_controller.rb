class LibraryController < ApplicationController
  def index
    user = User.find(params.require(:user_id))
    @contents = user.contents

    render json: @contents
  end
end
