extends Node

const ENEMY_GROUP = "inimigos"
const ENEMY_GROUP_TAKE_DAMAGE = "take_damage"

# Auxiliar Constants
var SCREEN_LIMITS = OS.get_window_size()
var PREFAB_SHOT = preload("res://scenes/Shot.tscn")
var PREFAB_METEOR = preload("res://scenes/Meteoro.tscn")

func _ready():	
	pass