get '/reportarConflicto' do
   erb :reportarConflicto
end

get '/reportarConflicto/:id' do
   @conflictoSeleccionado = Conflicto.get(params[:id])
   @asunto = @conflictoSeleccionado.asunto
   @alcance = @conflictoSeleccionado.alcance
   @resumen = @conflictoSeleccionado.resumen

   @demandantes = @conflictoSeleccionado.demandantes.first.actor
   @demandados = @conflictoSeleccionado.demandados.first.actor

   erb :reportarConflicto
end

get '/reportarConflicto/adicionar' do
   params.inspect
end