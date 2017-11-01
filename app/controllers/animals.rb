# RESTFUL Routing:
# display all things
get '/animals' do
  erb :"/animals/index"
end

# render a new thing form
get '/animals/new' do
  authenticate!
  erb :"/animals/new"
end

# create a new thing
post '/animals' do
  authenticate!
  redirect '/animals'
end

# display a specific thing
get '/animals/:id' do
  erb :"/animals/show"
end

# render an edit form for a thing
get '/animals/:id/edit' do
  authenticate!
  authorized!
  erb :"/animals/:id/edit"
end

# update a thing
put '/animals/:id' do
  authenticate!
  authorized!
  redirect "/animals/#{params[:id]}"
end

# delete a specific thing
delete '/animals/:id' do
  authenticate!
  authorized!
  redirect '/animals'
end


