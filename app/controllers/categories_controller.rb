class CategoriesController < ApplicationController
  def index

  @roots = Category.roots
  
  end

  def show
    @category = Category.find(params[:id])
    @children = @category.children
  end
end
