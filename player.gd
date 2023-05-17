extends Area2D


var _rotation_speed := PI / 120.0
var _max_speed := 400.0
var _current_speed := 0.0
var _screen_size : Vector2


# Called when the node enters the scene tree for the first time.
func _ready():
	_screen_size = get_viewport_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_rotate()
	_setCurrentSpeed()
	_setPosition(delta)


func _rotate():
	if Input.is_action_pressed("turn_right"):
		rotate(_rotation_speed)
	if Input.is_action_pressed("turn_left"):
		rotate(-_rotation_speed)


func _setCurrentSpeed():
	if Input.is_action_pressed("accelerate"):
		_current_speed = min(_max_speed, _current_speed + 10)
	if Input.is_action_pressed("decelerate"):
		_current_speed = max(0, _current_speed - 2)


func _setPosition(delta):
	var velocity := Vector2.from_angle(rotation - (PI / 2))
	velocity = velocity.normalized() * _current_speed if velocity.length() > 0 else velocity
	position += velocity * delta
	position.x = clamp(position.x, 0, _screen_size.x)
	position.y = clamp(position.y, 0, _screen_size.y)
