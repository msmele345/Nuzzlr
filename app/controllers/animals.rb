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


# show
get '/animals/:id' do
  @animal = Animal.find_by(id: params[:id])
  @nuzzle = Nuzzle.find_by(animal_id: params[:id])
  ep @nuzzle
  erb :"/animals/show"
end

##edit
get '/animals/:id/edit' do
  @animal = Animal.find_by(id: params[:id])
  erb :"/animals/edit"
end

# update a thing
put '/animals/:id' do
  authenticate!
  @animal = Animal.find(params[:id])
  ep @animal
  # authorize!(@animal.uploaded_owner_id)
  @animal.update_attributes(params[:animal])


  redirect "/animals/#{params[:id]}"
end

# delete a specific thing
delete '/animals/:id' do
  authenticate!
  @animal = Animal.find(params[:id])

  @animal.destroy

  redirect '/animals'
end


