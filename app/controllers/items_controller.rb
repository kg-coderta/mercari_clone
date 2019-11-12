class ItemsController < ApplicationController

  def index
    @items = Item.all.limit(10).order('id DESC')
  end

  def new
    @items = Item.new
    10.times { @items.photos.build }

  end

def create
  @item = Item.new(item_params)
  if @item.save
    redirect_back(fallback_location: root_path)
  else
    redirect_back(fallback_location: "/items/new")
    binding.pry
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
    params.require(:item).permit(
      :name, 
      :description, 
      :state, 
      :size, 
      :method, 
      :carriage, 
      :region, 
      :date, 
      :price,
      photos_attributes: [:image]
    ).merge(saler_id: current_user.id)
  end
end