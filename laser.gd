extends Area2D


var _base_speed = 100
var _speed_multiplier = 1.0
var _max_speed = 450.0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity := Vector2.from_angle(rotation - (PI / 2))
	velocity = (velocity.normalized() * min(_base_speed * _speed_multiplier, _max_speed)) if velocity.length() > 0 else velocity
	position += velocity * delta


func set_speed_multiplier(speed_multiplier):
	_speed_multiplier = speed_multiplier


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
