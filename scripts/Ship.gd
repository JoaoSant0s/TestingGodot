extends Node2D

export var life = 100
export var velocity = 200
export var initial_color = Color("#0000FF")
var interval = 0.3
var lastShot = 0
var sprite
var cannonOrigin
var spriteSize
var isDead
var characterNumber = 0


func _ready():
	set_process(true)
	sprite = get_node("sprite")
	cannonOrigin = get_node("cannonOrigin")
	spriteSize = sprite.get_texture().get_size()
	pass

func init(data):
	initial_color = data.color
	set_color()
	characterNumber = data.number
	set_pos(data.position)
	pass

func set_color():
	sprite.set_modulate(initial_color)
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
			var instance = Constants.PREFAB_SHOT.instance()
			instance.set_global_pos(cannonOrigin.get_global_pos())
			get_node("../").add_child(instance)
			lastShot = interval
	pass

	if lastShot > 0:
		lastShot -=delta

func _set_player_limits():

	var positionX = min( max(get_pos().x, spriteSize.x/2), (Constants.SCREEN_LIMITS.x - spriteSize.x/2) )
	var positionY = min( max(get_pos().y, spriteSize.y/2), (Constants.SCREEN_LIMITS.y - spriteSize.y/2) )

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

func _on_area_enter(collider):
	if collider.is_in_group(Constants.ENEMY_GROUP):
		_take_damage(collider.damage)
	pass

func _take_damage(damage):
	if isDead: return
	life -= damage

	get_node("anim").play("hit")
	get_node("anim").queue("idle")

	if life <= 0:
		isDead = true
		print ("dying")