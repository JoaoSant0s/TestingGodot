extends Area2D

export var velocity = 200
export var life = 100
export var damage = 10
var rand_rotation

var sprite
var spriteSize
var isDead

func _ready():
	add_to_group(Constants.ENEMY_GROUP)
	randomize()	
	set_process(true)
	_get_components()
	_set_rand_values()	
	pass

func _set_rand_values():
	rand_rotation = rand_range(-1, 1)
	var rand_position = rand_range(spriteSize.x, (Constants.SCREEN_LIMITS.x - spriteSize.x))
	set_pos(Vector2(rand_position, -spriteSize.y))
	pass

func _get_components():
	sprite = get_node("sprite")
	spriteSize = sprite.get_texture().get_size()
	pass

func _process(delta):	
	set_pos(get_pos() + Vector2(0, 1) * delta * velocity)	
	rotate(rand_rotation * delta)
	pass

func take_damage(damage):
	if isDead: return

	life -= damage
	get_node("anim").play("hit")
	get_node("anim").queue("idle")

	if life <= 0:
		isDead = true
		queue_free()
	pass
