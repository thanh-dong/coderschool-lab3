class ProductsController < ApplicationController
  def index
    if params[:sort] == "alphabetical"
      @products = Product.new.alphabetical
    else
      @products = Product.all
    end
  end
end
