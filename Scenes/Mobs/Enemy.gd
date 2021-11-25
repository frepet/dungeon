extends Mob

var path: PoolVector2Array
var nav = null
var line2d = null
var target = null

var max_follow_range = 10*32 # 10 tiles

func _ready():
	yield(owner, "ready") # Need to wait for owner to be ready. "MainScene"
	nav = owner.nav # loads nav from owner. "MainScene"
	line2d = owner.line2d # loads line2d from owner. "MainScene"
	
	seed(OS.get_unix_time())
	self.velocity = Vector2(32, 0).rotated(randf()*2*PI)
	._ready()

func _physics_process(delta):
	if hostile_out_of_range():
		print("Taget lost")	
		target = null
	if target != null:
		move_towards_hostile()
	elif randf() > 0.90:
		self.velocity = self.velocity.rotated(randf() - 0.5)
	._physics_process(delta)
	
func hostile_out_of_range() -> bool:
	if target == null:
		return false
	if self.global_position.distance_to(self.target.global_position) > self.max_follow_range:
		return true
	return false

func move_towards_hostile() -> void:
	self.path = nav.get_simple_path(self.global_position, target.global_position, false)
	line2d.points = self.path
	return
	
func _on_Perception_body_entered(body):
	print("Body Entered!")
	if self != body:
		print("Taget acquired")	
		self.target = body
