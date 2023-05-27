extends CharacterBody2D

var _speed = 200;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func move_toward_player(player_position: Vector2):
	var move = player_position.normalized() * _speed
	move_and_collide(move)
