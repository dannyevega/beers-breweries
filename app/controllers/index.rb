get '/' do
  @beers = Beer.all
  erb :index
end

get '/beers/new' do
  erb :new_beer
end

post '/beers' do
  brewery = Brewery.find_by(name: params[:brewery])
  if brewery
    brewery.beers.create(name: params[:name], score: params[:score])
    ## or Beer.create(name: params[:name], score: params[:score], brewery_id: brewery.id)
  else
    brewery = Brewery.create(name: params[:brewery], location: params[:location])
    brewery.beers.create(name: params[:name], score: params[:score])
    ## or Beer.create(name: params[:name], score: params[:score], brewery_id: brewery.id)
  end
  redirect '/'
end

get '/beers/:id' do
  @beer = Beer.find(params[:id])
  erb :beer_info
end

get '/beers/:id/edit' do
  @beer = Beer.find(params[:id])
  erb :edit
end

put '/beers/:id' do
  beer = Beer.find(params[:id])
  beer.update_attributes(name: params[:name], score: params[:score])
  redirect '/'
end

delete '/beers/:id' do
  beer = Beer.find(params[:id])
  beer.destroy
  redirect '/'
end
