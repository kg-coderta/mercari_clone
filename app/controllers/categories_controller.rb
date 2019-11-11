class CategoriesController < ApplicationController
  def index

  @roots = Category.roots

  end

  def show
  end
end
