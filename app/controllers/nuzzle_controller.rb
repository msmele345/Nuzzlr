post '/animals/:id/nuzzles' do
  new_nuzzle = params[:nuzzle_count].to_i
  ep params
  p "************"
  @animal = Animal.find(params[:id])
  @nuzzle = Nuzzle.new(:owner_id => current_user.id, :animal_id => @animal.id, :nuzzle_count => @animal.nuzzles.count)

  ep @nuzzle

  redirect "/animals/#{params[:id]}"
end

