get '/reportarConflicto' do
   @x = params[:x]
   @y = params[:y]

   erb :reportarConflicto
end

get '/reportarConflicto/:id' do
   @conflictoSeleccionado = Conflicto.get(params[:id])
   @asunto = @conflictoSeleccionado.asunto
   @alcance = @conflictoSeleccionado.alcance
   @resumen = @conflictoSeleccionado.resumen

   @demandantes = @conflictoSeleccionado.demandantes.first.actor
   @demandados = @conflictoSeleccionado.demandados.first.actor

   @medidaPresion = @conflictoSeleccionado.medidasPresion.first.tipo

   erb :reportarConflicto
end

get '/reportarConflicto/adicionar' do
   params.inspect
end

get '/reporte/enviado' do
   erb :informacionEnviada
end