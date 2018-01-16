extends Node

const ENEMY_GROUP = "inimigos"
const ENEMY_GROUP_TAKE_DAMAGE = "take_damage"

# Auxiliar Constants
var SCREEN_LIMITS = OS.get_window_size()
var PREFAB_SHOT = preload("res://scenes/Shot.tscn")
var PREFAB_METEOR = preload("res://scenes/Meteoro.tscn")
var PREFAB_PLAYER = preload("res://scenes/Ship.tscn")

var PLAYER_ONE = {
	"number": 0,
	"position": Vector2(SCREEN_LIMITS.x * 0.75, SCREEN_LIMITS.y * 0.85),
	"color": Color("#0000FF")
}

var PLAYER_TWO = {
	"number": 1,
	"position": Vector2(SCREEN_LIMITS.x * 0.25, SCREEN_LIMITS.y * 0.85),
	"color": Color("#00FF00")
}