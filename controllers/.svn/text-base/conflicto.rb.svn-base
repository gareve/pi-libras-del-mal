get '/conflicto/:id' do
   id = params[:id]
   @conflicto = Conflicto.get(id)

   erb :show_conflicto
end

get '/conflicto.json/:id' do
   id = params[:id]
   @conflicto = Conflicto.get(id)

   {
      :asunto => @conflicto.asunto,
      :demandado => @conflicto.demandados.first.actor,
      :demandante => @conflicto.demandantes.first.actor,
      :medidaDePresion => @conflicto.medidasPresion.first.tipo,
      :alcance => @conflicto.alcance,
      :descripcion => @conflicto.resumen
   }.to_json
end