import lxml.etree as et
import random


class Node:
    def __init__(self, name, adjacent, came, step, accumulate, line):
        self.name = name
        self.adjacent = adjacent
        self.came = came
        self.step = step
        self.accumulate = accumulate
        self.line = line


class Line:
    def __init__(self, name, stations):
        self.name = name
        self.stations = stations


lines = []
nodes = []
metro = []
lineStations = []
root = et.parse('Metro_CDMX.kml')
for lineName in root.xpath('/kml/Document/Folder[1]/Placemark//name/text()'):
    lines.append(lineName)

for lineName in lines:
    print("-", lineName)
    for station in root.xpath(
    "/kml/Document/Folder[1]/Placemark[name='" + lineName + "']/LineString/coordinates/text()"):
        a = station.split()
        lineStations = []
        for idx, b in enumerate(a):
            for name in root.xpath("/kml/Document/Folder[2]/Placemark[contains(./Point/coordinates,'" +
                                   station.split()[idx] + "')]/name/text()"):
                lineStations.append(name)
                print("\t-", name, ", ", station.split()[idx])
        metro.append(Line(lineName, lineStations))

for i in metro:
    for idx, station in enumerate(i.stations):
        ans = False
        dsa = 0
        for z, asd in enumerate(nodes):
            if station == asd.name:
                ans = True
                dsa = z
        if idx > 0:
            if idx < len(i.stations) - 1:
                if ans:
                    nodes[dsa].adjacent = nodes[dsa].adjacent + [i.stations[idx - 1], i.stations[idx + 1]]
                else:
                    nodes.append(Node(station, [i.stations[idx - 1], i.stations[idx + 1]], None, 0, 0, i.name))
            else:
                if ans:
                    nodes[dsa].adjacent = nodes[dsa].adjacent + [i.stations[idx - 1]]
                else:
                    nodes.append(Node(station, [i.stations[idx - 1]], None, 0, 0, i.name))
        else:
            if ans:
                nodes[dsa].adjacent = nodes[dsa].adjacent + [i.stations[idx + 1]]
            else:
                nodes.append(Node(station, [i.stations[idx + 1]], None, 0, 0, i.name))

print("Estacion de origen: ")
origin = input()
print("Estacion destino:")
destiny = input()

index = 0

for i, node in enumerate(nodes):
    if origin == node.name:
        index = i
        break

permanents = []
tagged = []

permanents.append(nodes[index])
while True:
    if len(permanents) == len(nodes):
        break
    for ady in nodes[index].adjacent:
        if next((x for x in permanents if x.name == ady), None) is None:
            for n in nodes:
                if n.name == ady:
                    if n.accumulate == 0 or n.accumulate > nodes[index].accumulate + 1:
                        n.accumulate = nodes[index].accumulate + 1
                        n.step = nodes[index].step + 1
                        n.came = nodes[index].name
                        tagged.append(n)
                        break
    lowest = []
    lowest.append(tagged[0])
    for tag in tagged:
        if tag.accumulate < lowest[0].accumulate:
            lowest.clear()
            lowest.append(tag)
        if tag.accumulate == lowest[0].accumulate:
            lowest.append(tag)
    if len(lowest) > 1:
        i = random.randint(0, len(lowest) - 1)
    else:
        i = 0
    for x, a in enumerate(nodes):
        if a.name == lowest[i].name:
            index = x
            break
    for i, f in enumerate(tagged):
        if f.name == nodes[index].name:
            tagged.pop(i)
            break
    permanents.append(nodes[index])

route = []
destinyStation = ''
stp = []

while True:
    for n in nodes:
        if destiny == n.name:
            route.append(n)
            destiny = n.came
            break
    if destiny == origin:
        break
route.reverse()

print("Te subes en: ", origin, " ", route[0].line)
for i, station in enumerate(route):
    if i > 0:
        if i < len(route)-1 and station.line != route[i - 1].line:
            print("transbordas de: ", route[i - 1].line, " a ", station.line)
    print("Estacion: ", station.name, "Linea: ", station.line)
    if i == len(route)-1:
        print("Llegaste a tu destino")
print("Lineas pasadas: ", len(route), "Proxima estacion: ")