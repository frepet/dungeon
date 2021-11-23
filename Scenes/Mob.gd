extends KinematicBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite.modulate = Color(1, 0, 0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func hit(msg):
	queue_free()
