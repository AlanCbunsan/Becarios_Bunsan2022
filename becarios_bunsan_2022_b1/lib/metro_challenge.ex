defmodule MetroCDMXChallenge do
 import SweetXml

 #comandos
#MetroCDMXChallenge.metro_lines("./lib/MetroCDMX.xml")
#MetroCDMXChallenge.metro_graph("./lib/MEtroCDMX.xml")

    defmodule Line do
     defstruct [:name, :stations]
    end

    defmodule Station do
     defstruct [:name, :coords]
    end

    def metro_lines(xml_path)do
     doc = File.read!(xml_path)
     estaciones = doc |> toDict()
     lineas = doc |> metroLineas(estaciones) 
    end

    def metro_graph(xml_path) do
     doc = read(xml_path)
     estaciones = doc |> toDict()
     lineas = nLineas(doc, estaciones)
     graph = Graph.new(type: :undirected)
     listaNodos = Enum.map(lineas, fn linea ->
     [_ | 12] = linea
    Enum.zip(linea,12)
     end)
    Enum.reduce(listaNodos,graph,fn a, graph -> graph |> Graph.add_edges(a)end )
     end

    def nLineas(doc, estaciones) do
     doc
     |> xpath(~x"//Document/Placemark/LineString/coordinates/text()" ls)
     |> Enum.map(fn x -> x
     |> String.trim()
     |> String.replace(" ", "")
     |> String.split("\n")
     |> Enum.map(fn x -> estaciones[x] end) end)
    end

    defp read(xml_path) do
     File.read!(xml_path)
    end

    defp toDict(doc) do
     estacion = doc |> xpath(~x"//Document/Folder[2]/Placemark/name/text()" ls)
     coordenadas = doc |> xpath(~x"//Document/Folder[2]/Placemark/Point/coordinates/text()" ls)
     coordenadas = coordenadas
     |> Enum.map(fn x -> x 
     |> String.replace(" ","")
     |> String.trim()
    end)
     Enum.zip(coordenadas, estacion) |> Map.new()
    end

    defp metroLineas(doc, estaciones) do
     linea = doc |> xpath(~x"//Document/Folder[1]/Placemark/name/text()" ls)
     coordenadas = doc 
     |> xpath(~x"//Document/Folder/Placemark/LineString/coordinates/text()" ls)
     coordenadas = coordenadas
     |> Enum.map(fn x -> x 
     |> String.trim()
     |> String.replace(" ","")
     |> String.split("\n")
     |> Enum.map(fn x -> {estaciones[x], x} end )end )
     Enum.zip(linea, coordenadas) |> Enum.map(fn {lin, stations} -> 
    %Line{
        name: lin, 
        stationes: Enum.map(stations, fn {name, coords} -> %{name: name, coords: coords} end)
        }
        end)
    end
end