extends Node

@export var laser_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var speed_multiplier = $Player.current_speed / 50 + 1.0
	get_tree().call_group("lasers", "set_speed_multiplier", speed_multiplier)


func _on_player_shot_laser():
	var laser = laser_scene.instantiate()
	laser.position = $Player.position
	laser.rotation = $Player.rotation
	# Move laser in front of the ship
	laser.move_local_y(-30)
	$Lasers.add_child(laser)
