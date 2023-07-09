import folium
import serial
import time
# decode lat 


f = open("tm.txt")
points = []
for line in f:
    if line=="\n":
        continue
    lat, long, timestamp = line.split(",")
    print(lat, long)
    points.append([float(lat), float(long)])
f.close()
# show points on map
m = folium.Map(location=[points[0][0], points[0][1]], zoom_start=15)
for point in points:
    folium.Marker(point).add_to(m)
m.save("map.html")

