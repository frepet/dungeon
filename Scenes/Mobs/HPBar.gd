extends Polygon2D

onready var mob = get_parent()

func _process(delta):
	self.rotation = -mob.rotation
	self.scale = Vector2(max(float(mob.hp) / mob.maxHp, 0.0), 1.0)
