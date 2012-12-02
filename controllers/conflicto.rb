get '/conflicto/:id' do
   id = params[:id]
   @conflicto = Conflicto.get(id)

   erb :show_conflicto
end