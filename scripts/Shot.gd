extends Area2D

export var velocity = 500
export var damage = 50
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

func _on_area_enter(collider):	
	if collider.is_in_group(Constants.ENEMY_GROUP):
		if collider.has_method(Constants.ENEMY_GROUP_TAKE_DAMAGE):
			collider.take_damage(damage)
		queue_free()
	
	pass