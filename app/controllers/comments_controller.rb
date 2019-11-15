class CommentsController < ApplicationController
  before_action :set
  before_action :authenticate_user!

  def create
    @comment = @item.comments.new(comment_params)
    if @comment.save
      redirect_to item_path(@item)
    else
      redirect_to root_path
    end
  end

  def destroy
    @comment = @item.comments.find(params[:id])
    if @comment.user_id == current_user.id
      @comment.destroy
      redirect_to item_path(@item)
    else
      redirect_to root_path
    end
  end


  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id)
  end

  def set
    @item = Item.find(params[:item_id])
  end
end