class CommentsController < ApplicationController

  def create
    item = Item.find(params[:item_id])
    @comment = item.comments.new(comment_params)
    if @comment.save
      redirect_to item_path(params[:item_id])
    else
      redirect_to item_path(params[:item_id])
    end
  end

  def destroy
    item = Item.find(params[:item_id])
    @comment = item.comments.find(params[:id])
    if @comment.user_id == current_user.id
      @comment.destroy
    else
      redirect_to item_path(params[:item_id])
    end
    redirect_to item_path(params[:item_id])
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id)
  end
end
