extends Area2D

var timeout = 60

func spawn(position):
	self.position = position
	return self

func _process(delta):
	timeout -= 1
	if timeout < 0:
		queue_free()

func _on_AOE_body_entered(body):
	if body.is_in_group("Hittable"):
		body.hit("Hit by projectile")
