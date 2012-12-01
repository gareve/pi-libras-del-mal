# encoding: UTF-8
#######################
# Persistence
#######################

DataMapper::Logger.new($stdout, :debug)

DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/sqlite.db")

class Conflicto
   include DataMapper::Resource
   property :id, Serial
   property :asunto, String, :length => 100
   property :resumen, String, :length => 100
   property :alcance, String, :length => 100
   property :salida, String, :length => 100
   property :reportado, String, :length => 100

   has n,:demandantes,:constraint => :destroy!
   has n,:demandados,:constraint => :destroy!
   has n,:medidasPresion,'MedidaPresion',:constraint => :destroy!
   has n,:lugares,'Lugar',:constraint => :destroy!
end

class Demandante
   include DataMapper::Resource
   property :id, Serial
   property :actor, String, :length => 100
   property :sector, String, :length => 100
   belongs_to :conflicto
end

class Demandado
   include DataMapper::Resource
   property :id, Serial
   property :actor, String, :length => 100
   property :sector, String, :length => 100
   belongs_to :conflicto
end

class MedidaPresion
   include DataMapper::Resource
   property :id, Serial
   property :fecha, Date
   property :tipo, String, :length => 100
   property :nivel, String, :length => 100
   belongs_to :conflicto
end

class Lugar
   include DataMapper::Resource

   property :id, Serial
   property :localidad, String, :length => 100
   property :provincia, String, :length => 100
   property :departamento, String, :length => 100
   property :pais, String, :length => 100
   property :x,Float
   property :y,Float

   belongs_to :conflicto
end


p "Datamapper finished"

DataMapper.finalize #Call this when the models are finished
#Usuario.auto_upgrade! #Create Schema

#require 'dm-migrations'
#DataMapper.auto_migrate!

#DataMapper.auto_migrate!
#Test Data
require './setup/inputExcel.rb'

def populate_db

   p "*******************************"
   p "*******INSERTING VALUES********"
   p "*******************************"
   inputExcel = InputExcel.new
   inputExcel.chargeFile

end

