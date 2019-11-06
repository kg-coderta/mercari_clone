class ItemsController < ApplicationController
  def index
    @items = Item.all.limit(10).order('id DESC')
  end

  def new
  end

  def show
  end

  def new
  end

  def edit
  end
end
