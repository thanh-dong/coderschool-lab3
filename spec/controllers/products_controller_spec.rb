require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
   describe "GET #index" do
     it "responses successfully with an HTTP 200 status code" do
       get :index
       expect(response).to be_success
       expect(response).to have_http_status(200)
     end

     it "renders the index template" do
       get :index
       expect(response).to render_template("index")
     end

     it "loads all products into @products" do
       prod1, prod2 = Product.create!, Product.create!
       get :index

       expect(assigns(:products)).to match_array([prod1, prod2])
     end

     it "loads all products into @products in alphabetical order" do
       prod1 = create(:product, name: "prodB")
       prod2 = create(:product, name: "prodA")

       get :index, sort: "alphabetical"

       expect(assigns(:products)).to eq ([prod2, prod1])
     end

     it "loads all products into @products not in alphabetical order" do
       prod1 = create(:product, name: "prodB")
       prod2 = create(:product, name: "prodA")

       get :index, sort: "no_sort"

       expect(assigns(:products)).to match_array ([prod2, prod1])
     end
   end
end
