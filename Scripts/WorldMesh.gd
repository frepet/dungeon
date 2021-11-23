tool
extends MeshInstance2D

var world = [
	[Color(0,0,1), Color(0,0,1), Color(0,1,0), Color(0,1,0)],
	[Color(0,0,1), Color(0,0,1), Color(0,1,0), Color(0,1,0)]
]

func _draw():
	var center = Vector2(200, 200)
	var size = 32

	for row in world.size():
		if row < world.size()-1:
			for col in world[row].size():
				if col > 0 and col 
				draw_tile(center + Vector2(size*col, row), size, world[i])

func get_tile(x, y):
	world

func draw_tile(position, size, color):
	var points_arc = PoolVector2Array()
	var colors = PoolColorArray()

	points_arc.push_back(position + Vector2(0, 0) * size)
	colors.push_back(color)
	points_arc.push_back(position + Vector2(1, 0) * size)
	colors.push_back(color)
	points_arc.push_back(position + Vector2(1, 1) * size)
	colors.push_back(color)
	points_arc.push_back(position + Vector2(0, 1) * size)
	colors.push_back(color)

	draw_polygon(points_arc, colors)

func draw_hex(center, radius, color):
	var points_arc = PoolVector2Array()
	var colors = PoolColorArray()

	for i in range(6):
		var angle_point = deg2rad(i * 60 - 90)
		points_arc.push_back(center + Vector2(cos(angle_point), sin(angle_point)) * radius)
		colors.push_back(color)
	
	draw_polygon(points_arc, colors)
