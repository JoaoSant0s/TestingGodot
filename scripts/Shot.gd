extends Node2D

export var velocity = 500
var sprite
var spriteSize

func _ready():
	set_process(true)
	sprite = get_node("sprite")
	spriteSize = sprite.get_texture().get_size()
	pass

func _process(delta):
	set_pos(get_pos() + Vector2(0, -1) * delta * velocity)

	if get_pos().y  < - (spriteSize.y / 2):
		free()
		pass