class StaticPagesController < ApplicationController
  def home
    if user_signed_in?
      @posts = current_user.feed
    end
  end
end
