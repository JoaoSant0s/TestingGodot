extends Node2D

export var characterNumber = 0
export var velocity = 200
export (Color) var color
var prefabShot = preload("res://scenes/Shot.tscn")
var interval = 0.3
var lastShot = 0
var sprite
var cannonOrigin
var playerLimits = OS.get_window_size()

func _ready():
	set_process(true)
	sprite = get_node("sprite")
	cannonOrigin = get_node("cannonOrigin")
	sprite.set_modulate(color)
	pass

func _process(delta):
	_check_shoot(delta)
	_set_vertical_controllers(delta)
	_set_horizontal_controllers(delta)
	_set_player_limits()
	pass


func _check_shoot(delta):
	if Input.is_action_pressed("control_shoot_" + str(characterNumber)):
		if lastShot <= 0:
			var instance = prefabShot.instance()
			instance.set_global_pos(cannonOrigin.get_global_pos())
			get_node("../").add_child(instance)
			lastShot = interval
	pass

	if lastShot > 0:
		lastShot -=delta

func _set_player_limits():
	var spriteSize = sprite.get_texture().get_size()
	var positionX = min( max(get_pos().x, spriteSize.x/2), (playerLimits.x - spriteSize.x/2) )
	var positionY = min( max(get_pos().y, spriteSize.y/2), (playerLimits.y - spriteSize.y/2) )

	set_pos(Vector2(positionX, positionY))
	pass

func _set_vertical_controllers(delta):
	var direction = 0	

	if Input.is_action_pressed("control_up_" + str(characterNumber)):
		direction = -1

	if Input.is_action_pressed("control_down_" + str(characterNumber)):
		direction = 1

	set_pos(get_pos() + Vector2(0, 1) * delta * velocity * direction)
	pass

func _set_horizontal_controllers(delta):
	var direction = 0	

	if Input.is_action_pressed("control_right_" + str(characterNumber)):
		direction = 1

	if Input.is_action_pressed("control_left_" + str(characterNumber)):
		direction = -1

	set_pos(get_pos() + Vector2(1, 0) * delta * velocity * direction)
	pass