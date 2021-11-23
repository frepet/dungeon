extends Area2D

var timeout = 60

func spawn(position):
	self.position = position
	return self

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timeout -= 1
	if timeout < 0:
		queue_free()
