class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
  end

def create
  @item = Item.new(item_params)
  @item.saler_id = current_user.id
  if @post.save
    redirect_back(fallback_location: root_path)
  else
    redirect_back(fallback_location: root_path)
  end
end

  def show
    @item = Item.includes(:photos).find(params[:id])
    @saler = User.find(@item.saler_id)
    @saler_items = Item.where(saler_id: @saler.id).limit(6).order('id DESC')

    @comments = @item.comments.includes(:user)
    @comment = Comment.new
  end

  def edit
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :state, :size, :method, :carriage, :region, :date, :price).merge(saler_id: current_user.id)
  end
end