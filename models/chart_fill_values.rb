
  def load_charts_value
    @title1 = "Cobertura de Medios de comunicacion - Bolivia"
    @title2 = "Cobertura de Medios de comunicacion - Latinoamerica"
    @title3 = "Cobertura de Medios de comunicacion - Sectores Sociales (Bolivia)"
    @title4 = "Numero de conflictos actuales - Bolivia"

    @titleY1 = "Cobertura"
    @titleY2 = "Cobertura"
    @titleY3 = "Cobertura"
    @titleY4 = "Numero de Conflictos"

    @lugar = Lugar.all
    #cobertura json1
    dpto = []
    @lugar.each do |lugar|
      dpto << lugar.departamento
    end
    dpto.uniq!
    @json1 = Hash.new
    @json1["categories"] = dpto
    @type = "column"           

    @series1 = [
      {"name" => "Usuario", "data" => [1,2,3,3,3,3,1,0,1]},
      {"name" => "Parcial", "data" => [3,1,1,1,1,1,2,4,2]},
      {"name" => "Total",   "data" => [2,3,2,2,2,2,1,1,5]}
    ]
    
    #Pais
    paises = []
    @lugar.each do |lugar|
      paises << lugar.pais
    end
    paises.uniq!
    @json2 = Hash.new
    @json2["categories"] = paises
    @type = "column"
    @series2 = [
      {"name" => "Usuario", "data" =>  [1,3,1]}, 
      {"name" => "Parcial", "data" =>  [3,4,3]},
      {"name" => "Total", "data" =>    [2,5,1]}
    ]
    
    #Area
    @demandante = Demandante.all
    demandantes = []
    @demandante.each do |dmt|
      demandantes << dmt.sector
    end
    demandantes.uniq!
    @json3 = Hash.new
    vv = []
    for i in 0..6
      vv << demandantes[i]
    end
    @json3["categories"] = vv
    @series3 = [
      {"name" => "Usuario", "data" =>      [1,2,3,3,3,3]},
      {"name" => "Parcial", "data" =>  [3,1,1,1,1,1]},
      {"name" => "Total", "data" =>     [2,3,2,2,2,6]}
    ]

    #Estado
    @conflictos = Conflicto.all
    salidas = []
    @conflictos.each do |conflicto|
      salidas << conflicto.salida
    end
    salidas.uniq!
    @json4 = Hash.new
    @json4["categories"] = dpto
    @series4 = [
      {"name" => "Continua", "data" =>      [5,2,3,3,3,3,1,0,1]}, 
      {"name" => "Negociacion", "data" =>  [3,1,2,8,1,2,5,1,2]},
      {"name" => "Acuerdo Parcial", "data" =>  [3,1,1,8,5,2,5,2,2]},
      {"name" => "Acuerdo Total", "data" =>     [2,3,4,6,2,1,1,1,5]}
    ]
  end