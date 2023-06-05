class ApplicationController < Sinatra::Base

  # add routes
  get '/bakeries' do
    # get all the bakeries from the database
    bakeries = Bakery.all
    # send them back as a JSON array
    bakeries.to_json
    # render json: bakeries
  end

  # returns a single bakerry
  get '/bakeries/:id' do
    # finding the bakery based on id
    bakery = Bakery.find(params[:id])
    # include the baked goods in the bakery JSON respons
    bakery.to_json(include: :baked_goods)
  end

  # sorts an array of baked goods by price
  get '/bakeries/baked_goods/by_price' do
    # sort in descending order
    baked_goods = BakedGood.order(price: :desc)
    #  return them in JSON
    baked_goods.to_json
  end
  get '/baked_goods/most_expensive' do
    # get the most expensive baked good from the database
    most_expensive_baked_good = BakedGood.order(price: :desc).first
    # send it back as JSON
    most_expensive_baked_good.to_json
  end
  
end
