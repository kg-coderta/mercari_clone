class ItemsController < ApplicationController
  # before_action :set

  def index
    @item = Item.all
  end

  def show
    @item = Item.includes(:photos).find(params[:id])
    @photos = Photo.where(item_id: @item.id)
    @saler = User.find(@item.saler_id)
    @saler_items = Item.where(saler_id: @saler.id).limit(6).order('id DESC')

    @comments = @item.comments.includes(:user)
    @comment = Comment.new
  end


  private

  def item_params
    params.require(:item).permit(:name, :description, :state, :size, :method, :carriage, :region, :date, :price).merge(saler_id: current_user.id)
  end
end