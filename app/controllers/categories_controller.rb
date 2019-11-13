class CategoriesController < ApplicationController
  before_action :set_saling

  def index
  @roots = Category.roots
  end

  def show
    @category = Category.find(params[:id])
    @children = @category.children
    @indirect_items = @seling_items.where(category_id: @category.indirects.ids).page(params[:page]).per(130)

  end
end
