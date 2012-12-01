# encoding: UTF-8
require 'roo'
require './models/persistence.rb'

class InputExcel

   #Revisar!!!
   def initialize
      ######### Donde esta Mallku Qhota?????
      ######### Gran Chaco ?????

      @mp = {
         'la paz' => 'Nuestra Señora de La Paz',
         'santa cruz' => 'Santa Cruz de la Sierra',
         'san pablo'=>'san pablo de huacareta',
         'puerto suárez' => 'Puerto Suarez',
      'huanuni' => 'Villa Huanuni',#Será este?
      'guarayos' => 'Ascención de Guarayos',
      'san josé' => 'San Jose de Chiquitos',
      'caranda' => 'Carangas',
      'buenavista' => 'Buena Vista'
      }

      geojson = JSON.parse(open('./municipios.js').read)['features']

      @municipios = {}
      geojson.each do |feature|
         @municipios[feature['properties']['NOM_MUN'].downcase] = centro(feature['geometry']['coordinates'].first)
      end
   end

   def centro coordinates
      cx = 0
      cy = 0
      coordinates.each do |p|
         x = p[0]
         y = p[1]

         cx += x
         cy += y
      end
      len = coordinates.size

      cx /= len.to_f
      cy /= len.to_f

      return cx,cy
   end

   def filter lugar
      ans = @mp[lugar.downcase]
      ans = lugar if ans.nil?
      ans
   end

   def chargeFile
      input = Excelx.new("./setup/input.xlsx")
      input.default_sheet = input.sheets[0]
      ini = "A"
      fin = "R"

      while ini != fin
         p input.cell(126,ini)
         ini.next!
      end


      row = 127
      while row <= input.last_row
         #Llenar tabla Conflictos
         p "----------------------------------------"
         p "ID: " + input.cell(row, 'A').to_s
         iniRow = row
         while input.cell(row+1,'A') == nil and row <= input.last_row
            #Scan xlsx
            row = row + 1
         end
         finRow = row

         #Table Conflictos
         tmpIni = iniRow
         conflicto = Conflicto.new(
                                   :asunto => input.cell(tmpIni,'I'),
                                   :resumen => input.cell(tmpIni,'J'),
                                   :alcance => input.cell(tmpIni,'P'),
                                   :salida => input.cell(tmpIni,'Q'),
                                   :reportado => "Medio"
                                   );
         conflicto.save

         #Tabla Demandante
         #Actor A Sector A
         tmpIni = iniRow
         while input.cell(tmpIni,'B') != nil and tmpIni <= input.last_row
            demandante = Demandante.new(
                                        :actor => input.cell(tmpIni,'B'),
                                        :sector => input.cell(tmpIni,'C')
                                        )
            demandante.save
            conflicto.demandantes << demandante
            #conflicto.save
            tmpIni = tmpIni + 1
         end

         #Tabla Demandado
         #Actor B Sector B
         tmpIni = iniRow
         while input.cell(tmpIni,'D') != nil and tmpIni <= input.last_row
            demandado = Demandado.new(
                                      :actor => input.cell(tmpIni,'D'),
                                      :sector => input.cell(tmpIni,'E')
                                      )
            demandado.save
            conflicto.demandados << demandado
            #conflicto.save
            tmpIni = tmpIni + 1
         end

         #Lugar
         tmpIni = iniRow

         #TODO: Revisa Alvaro
         invalid_conflict = false
         while input.cell(tmpIni,'F') != nil and tmpIni <= input.last_row
            lugar = Lugar.new(
                              :localidad => filter(input.cell(tmpIni,'F')),
                              :provincia => input.cell(tmpIni,'G'),
                              :departamento => input.cell(tmpIni,'H'),
                              :pais => "Bolivia"
                              )
            if @municipios.has_key?(lugar.localidad.downcase)
               lugar.x,lugar.y = @municipios[lugar.localidad.downcase]
            else
               lugar.localidad = '@' + input.cell(tmpIni,'F')
               #invalid_conflict = true
            end

            lugar.save
            conflicto.lugares << lugar
            #conflicto.save
            tmpIni = tmpIni + 1
         end

         #Tabla MedidasPresion
         tmpIni = iniRow
         while tmpIni <= finRow and tmpIni <= input.last_row
            if(input.cell(tmpIni,'M').to_s !="" and input.cell(tmpIni,'N').to_s !="" and input.cell(tmpIni,'O').to_s != "")
               medida_presion = MedidaPresion.new(
                                                   :fecha  => "2012/09/" + input.cell(tmpIni,'M').to_s,
                                                   :tipo => input.cell(tmpIni,'N').to_s,
                                                   :nivel => input.cell(tmpIni,'O').to_s
                                                   )

               medida_presion.save
               conflicto.medidasPresion << medida_presion
               #conflicto.save
            end
            tmpIni = tmpIni + 1
         end
         conflicto.save

         if invalid_conflict
            conflicto.destroy
         end

         #break
         if row <= 20
            break
         end
         row=row + 1
      end
   end
end

