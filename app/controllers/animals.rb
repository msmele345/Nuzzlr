# RESTFUL Routing:
# display all things
##index
get '/animals' do
  @animals = Animal.all
  erb :"/animals/index"
end

##create
get '/animals/new' do
  erb :"/animals/new"
end

post '/animals' do
  authenticate!
  @animal = Animal.new(params[:animal])
  @animal.uploaded_owner_id = current_user.id

  if @animal.save
    redirect "/animals/#{@animal.id}"
  else
    @errors = @entry.errors.full_messages
    erb :'animals/new'
  end
end

post '/animals/:id/nuzzles' do
  ep params
  animal = Animal.find(params[:id])
  animal.nuzzle_count = animal.nuzzle_count += 1
  ep animal.nuzzle_count
  redirect "/animals/#{params[:id]}"
end

# show
get '/animals/:id' do
  @animal = Animal.find_by(id: params[:id])
  erb :"/animals/show"
end


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
  @animal = Animal.find(params[:id])
  @animal.destroy
  redirect '/animals'
end


