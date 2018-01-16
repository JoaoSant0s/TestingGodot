extends Node

func _ready():
	_instance_player(Constants.PLAYER_ONE)
	_instance_player(Constants.PLAYER_TWO)
	pass

func _instance_player(player_data):
	print (player_data)
	var instance = Constants.PREFAB_PLAYER.instance()
	get_node(".").add_child(instance)
	instance.init(player_data)
	pass