extends Area2D

signal shot_laser

@export var current_speed := 0

var _rotation_speed := PI / 120.0
var _max_speed := 400.0


# Called when the node enters the scene tree for the first time.
func _ready():
	$EngineFlame.hide()
	$TurningFlameRight.hide()
	$TurningFlameLeft.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_rotate()
	_setCurrentSpeed()
	_setPosition(delta)
	_handleFire()


func _rotate():
	if Input.is_action_pressed("turn_right"):
		$TurningFlameLeft.show()
		rotate(_rotation_speed)
	else:
		$TurningFlameLeft.hide()
	if Input.is_action_pressed("turn_left"):
		$TurningFlameRight.show()
		rotate(-_rotation_speed)
	else:
		$TurningFlameRight.hide()
		


func _setCurrentSpeed():
	if Input.is_action_pressed("accelerate"):
		current_speed = min(_max_speed, current_speed + 10)
	if Input.is_action_pressed("decelerate"):
		current_speed = max(0, current_speed - 2)
	if current_speed > 0:
		$EngineFlame.show()
	else:
		$EngineFlame.hide()


func _setPosition(delta):
	var velocity := Vector2.from_angle(rotation - (PI / 2))
	velocity = velocity.normalized() * current_speed if velocity.length() > 0 else velocity
	position += velocity * delta
	

func _handleFire():
	if Input.is_action_just_pressed("shoot_laser"):
		shot_laser.emit()
