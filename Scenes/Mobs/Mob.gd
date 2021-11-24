extends KinematicBody2D

var color = Color(1, 1, 1)
var velocity = Vector2(2*randf() - 1, 2*randf() - 1)

var hp = 100
var maxHp = 100

func spawn(position, color):
	self.position = position
	self.color = color
	self.velocity = self.velocity.rotated(randf() - 0.5)
	return self

func _ready():
	$Sprite.modulate = self.color

func _physics_process(delta):
	if self.hp <= 0:
		queue_free()
	if randf() > 0.95:
		self.velocity = self.velocity.rotated(randf() - 0.5)
	move_and_collide(self.velocity)

func hit(msg):
	self.hp -= 25
	
	
