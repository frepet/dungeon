extends KinematicBody2D

onready var AOESpellScene = preload("res://Scenes/Spells/AOE.tscn")

var fps = 60
var speed = 1
var acceleration = 1
var rotation_speed = deg2rad(2)
var target = Vector3(INF, INF, INF)
var direction = Vector2(1, 0)
var damage = 0

func spawn(params: Dictionary):
	var mana = params["mana"]
	self.transform = params["start"]
	self.target = params["target"]
	self.speed = 64*mana["red"]/100
	self.acceleration = self.speed / 10
	self.rotation_speed = deg2rad(2)
	self.scale = Vector2(mana["yellow"]/1000.0, mana["yellow"]/1000.0)
	self.direction = Vector2(cos(self.transform.get_rotation()), sin(self.transform.get_rotation()))
	self.damage = (mana["red"] + mana["yellow"]) / 2
	return self

func rotate_towards_target(delta):
	var dr = get_angle_to(self.target)
	if dr > 0:
		rotate(min(self.rotation_speed * self.fps * delta, dr))
	else:
		rotate(max(-self.rotation_speed * self.fps * delta, dr))
	self.direction = Vector2(cos(self.transform.get_rotation()), sin(self.transform.get_rotation()))

func _physics_process(delta):
	if self.speed > 0:
		rotate_towards_target(delta)
		var collision = move_and_collide(self.direction.normalized() * self.speed * delta)
		if collision and collision.collider.is_in_group("Hittable"):
			var mob = collision.collider
			mob.hit("Hit by projectile")
			_onHit(mob.position)
		elif self.position.distance_to(self.target) < 32:
			_onHit(self.target)
		else:
			self.speed = max(self.speed + self.acceleration, 64)
			self.rotation_speed += deg2rad(1)

func _onHit(position):
	get_parent().add_child(AOESpellScene.instance().spawn(position))
	queue_free()
	# TODO: Make the trail live on when projectile dies

func _on_Timer_timeout():
	queue_free()
