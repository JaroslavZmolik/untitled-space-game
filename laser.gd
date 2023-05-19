extends Area2D


var _base_speed = 100
var _screen_size : Vector2
var _speed_multiplier = 1.0
var _max_speed = 450.0


# Called when the node enters the scene tree for the first time.
func _ready():
	_screen_size = get_viewport_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity := Vector2.from_angle(rotation - (PI / 2))
	velocity = (velocity.normalized() * min(_base_speed * _speed_multiplier, _max_speed)) if velocity.length() > 0 else velocity
	position += velocity * delta
	if position.x > _screen_size.x or position.x < 0:
		queue_free()
	elif position.y > _screen_size.y or position.y < 0:
		queue_free()

func set_speed_multiplier(speed_multiplier):
	_speed_multiplier = speed_multiplier
