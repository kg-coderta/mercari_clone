class CommentsController < ApplicationController
  before_action :set

  def create
    @comment = @item.comments.create(comment_params)
    redirect_to item_path(@item)
  end

  def destroy
    @comment = @item.comments.find(params[:id])
    if @comment.user_id == current_user.id
      @comment.destroy
    else
      redirect_to root_path
    end
    redirect_to item_path(@item)
  end


  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id)
  end

  def set
    @item = Item.find(params[:item_id])
  end
end