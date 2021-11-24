extends KinematicBody2D

export (PackedScene) var Bullet
onready var projectileSpellScene = preload("res://Scenes/Spells/ProjectileSpell.tscn")

const speed_factor = 64*60 # 1 * speed_factor should move the player 1 sq/s
export (int) var speed = 2 * speed_factor
export (float) var rotation_speed = deg2rad(6)

var hp = 100
var maxHp = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func get_direction_of_movement():
	var direction = Vector2()
	if Input.is_action_pressed("up"):
		direction.y -= 1
	if Input.is_action_pressed("down"):
		direction.y += 1
	if Input.is_action_pressed("right"):
		direction.x += 1
	if Input.is_action_pressed("left"):
		direction.x -= 1
	return direction.normalized()

func rotate_towards_mouse():
	var dr = get_angle_to(get_global_mouse_position())
	if dr > 0:
		rotate(min(rotation_speed, dr))
	else:
		rotate(max(-rotation_speed, dr))

func casting():
	if Input.is_action_just_pressed("cast"):
		shoot(get_global_mouse_position())

func shoot(target):
	get_parent().add_child(projectileSpellScene.instance().spawn({
			"start": $Muzzle.global_transform,
			"target": target,
			"mana": {"red": 500, "yellow": 200}}))

func _physics_process(delta):
	move_and_slide(get_direction_of_movement() * delta * speed)
	rotate_towards_mouse()
	casting()
