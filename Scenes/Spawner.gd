extends Position2D

onready var mob = preload("res://Scenes/Mobs/Mob.tscn")

var mana = 0
var manaToSpawnMob = 100
var manaPerTick = 1

func _process(delta):
	mana += manaPerTick
	if mana >= manaToSpawnMob:
		mana -= manaToSpawnMob
		get_parent().add_child(mob.instance().spawn(self.position, Color(randf(), randf(), randf())))
