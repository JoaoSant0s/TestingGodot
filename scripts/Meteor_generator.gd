extends Node

var spawnTime = 0
var interval = 2

func _ready():
	set_process(true)
	pass

func _process(delta):
	if spawnTime <= 0:
		var instance = Constants.PREFAB_METEOR.instance()		
		get_node("../").add_child(instance)
		spawnTime = interval
		pass

	if spawnTime > 0:
		spawnTime -=delta