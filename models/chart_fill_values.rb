
  def load_charts_value
    @title1 = "Cobertura de Medios de comunicacion - Bolivia"
    @title2 = "Cobertura de Medios de comunicacion - Latinoamerica"
    @title3 = "Cobertura de Medios de comunicacion - Sectores Sociales (Bolivia)"
    @title4 = "Numero de Conflictos - Bolivia"

    @titleY1 = "Cobertura"
    @titleY2 = "Cobertura"
    @titleY3 = "Cobertura"
    @titleY4 = "Numero de Conflictos"

    @subTitleY1 = "Nivel de Cobertura por departamento"
    @subTitleY2 = "Nivel de Cobertura por Pais"
    @subTitleY3 = "Nivel de Cobertura por departamento"
    @subTitleY4 = ""


    @lugar = Lugar.all
    #cobertura json1
    dpto = []
    @lugar.each do |lugar|
      if(lugar.departamento != "Departamento")
      dpto << lugar.departamento
      end 
    end
    dpto.uniq!
    @json1 = Hash.new
    @json1["categories"] = dpto
    @type = "column"           

    @series1 = [
      {"name" => "Usuario", "data" => [1,2,3,3,1,3,1,0,1]},
      {"name" => "Parcial", "data" => [3,1,1,1,1,1,2,3,2]},
      {"name" => "Total",   "data" => [2,3,2,2,2,2,1,1,1]}
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
      {"name" => "Usuario", "data" =>  [10,0,1]}, 
      {"name" => "Parcial", "data" =>  [8,1,0]},
      {"name" => "Total", "data" =>    [8,0,0]}
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
    for i in 0..4
      vv << demandantes[i]
    end
    @json3["categories"] = vv
    @series3 = [
      {"name" => "Usuario", "data" =>      [1,2,3,3,3]},
      {"name" => "Parcial", "data" =>  [3,1,1,1,1]},
      {"name" => "Total", "data" =>     [2,3,2,2,2]}
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
      {"name" => "Continua", "data" =>      [3,2,0,3,0,3,2,0,0]}, 
      {"name" => "Negociacion", "data" =>  [0,1,0,2,0,4,1,0,0]},
      {"name" => "Acuerdo Parcial", "data" =>  [1,1,2,2,0,2,0,2,0]},
      {"name" => "Acuerdo Total", "data" =>     [3,3,0,1,4,1,2,1,1]}
    ]
  end