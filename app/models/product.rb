class Product < ActiveRecord::Base
  def alphabetical
    Product.order(:name)
  end
end
