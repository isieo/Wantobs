class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @commentable = @user
    @comments = @commentable.comments
    @comment = Comment.new
  end
end
