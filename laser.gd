extends Area2D

var _current_speed = 100;
var _screen_size : Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	_screen_size = get_viewport_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity := Vector2.from_angle(rotation - (PI / 2))
	velocity = velocity.normalized() * _current_speed if velocity.length() > 0 else velocity
	position += velocity * delta
	if position.x > _screen_size.x or position.x < 0:
		queue_free()
	elif position.y > _screen_size.y or position.y < 0:
		queue_free()
