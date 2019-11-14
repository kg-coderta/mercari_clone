class MypagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_selling
  def index

  end

  def destroy
  end

  def edit
  end

  def show
  end

  def selling
    @saler_items = @selling_items.where(saler_id: current_user.id)
  end

  def bought
    @bought_items = Item.where(buyer_id: current_user.id)
  end
end
