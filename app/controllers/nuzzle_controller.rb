post '/animals/:id/nuzzles' do
  @animal = Animal.find(params[:id])
  new_nuzzle = params[:nuzzle_count].to_i
  @total = @animal.nuzzles.count + 1
  @nuzzle = Nuzzle.new(:owner_id => current_user.id, :animal_id => @animal.id, :nuzzle_count => @total)

  @animal.nuzzles << @nuzzle

  redirect "/animals/#{params[:id]}"
end

