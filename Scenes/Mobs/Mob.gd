extends KinematicBody2D
class_name Mob

var velocity = Vector2.ZERO
var color = Color(1, 1, 1)

var hp = 100
var maxHp = 100

func spawn(position, color):
	self.position = position
	self.color = color
	return self

func _ready():
	$Sprite.modulate = self.color

func _physics_process(delta):
	if self.hp <= 0:
		queue_free()
	#move_and_collide(self.velocity * delta)

func hit(msg):
	self.hp -= 25
