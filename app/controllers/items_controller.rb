class ItemsController < ApplicationController
  before_action :set_item, only:[:destroy]

  def index
    @roots = Category.roots.limit(4)
    @items = Item.all.limit(10).order('created_at DESC')
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

  def buy
  end

  def detail
    @item = Item.includes(:photos).find(params[:id])
    @saler = User.find(@item.saler_id)

    @comments = @item.comments.includes(:user)
    @comment = Comment.new
  end

  def destroy
    if @item.saler_id == current_user.id && @item.destroy
      redirect_to root_path
    else 
      redirect_to items_path(@item)
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :state, :size, :method, :carriage, :region, :date, :price, :category_id).merge(saler_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end