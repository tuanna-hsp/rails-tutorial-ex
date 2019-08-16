class LikesController < ApplicationController
  before_action :logged_in_user

  def create
    @micropost = Micropost.find(params[:micropost_id])
    current_user.like(@micropost)
    redirect_to @micropost
  end

  def destroy
    @micropost = Micropost.find(params[:micropost_id])
    current_user.unlike(@micropost)
    redirect_to @micropost
  end
end
