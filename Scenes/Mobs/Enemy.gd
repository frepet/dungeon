extends Mob

var path: PoolVector2Array

func _ready():
	seed(OS.get_unix_time())
	self.velocity = Vector2(32, 0).rotated(randf()*2*PI)
	._ready()


func _physics_process(delta):
	if hostile_in_range():
		move_towards_hostile()
	elif randf() > 0.90:
		self.velocity = self.velocity.rotated(randf() - 0.5)
	._physics_process(delta)
	
	
func hostile_in_range() -> bool:
	return false


func move_towards_hostile() -> void:
	return

func _process(delta):
	self.draw_polyline(self.path, Color(1, 0, 0))

func _on_Perception_body_entered(body):
	print("Body Entered!")
	self.path = $Navigation2D.get_simple_path(self.position, body.position)
	print(self.path)
