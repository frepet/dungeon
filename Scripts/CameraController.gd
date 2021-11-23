extends Camera2D

onready var player = get_node("/root/MainScene/Player")

# Called when the node enters the scene tree for the first time.
func _ready():
	position.x = player.position.x
	position.y = player.position.y

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	position.x = player.position.x
	position.y = player.position.y
