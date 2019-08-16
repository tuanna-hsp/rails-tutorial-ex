class CommentsController < ApplicationController
  def create
    @post = Micropost.find(params[:micropost_id])
    @post.comments.create!(content: params[:comment][:content], user_id: current_user.id)
    redirect_to @post
  end
end
