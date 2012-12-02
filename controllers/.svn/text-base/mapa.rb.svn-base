get '/map' do
   @conflictos = Conflicto.all
   @parcial,@total,@usuario = separar(@conflictos)
   erb :map
end

get '/conflictoMiniInfo/:id' do
   @id = params[:id]
   @conflicto = Conflicto.all(:id => @id).first
   erb :conflictoMiniInfo,:layout => false
end

def separar conflictos
   vc = [[],[],[]]
   conflictos.each do |conflicto|
      vc[conflicto.getType] << conflicto
   end

   return vc[0],vc[1],vc[2]
end