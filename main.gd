extends Node

@export var laser_scene: PackedScene
@export var enemy_scene: PackedScene

var _enemy_spawn_safe_distance

# Called when the node enters the scene tree for the first time.
func _ready():
	_enemy_spawn_safe_distance = get_window().get_size_with_decorations().x - 400
	$EnemySpawnTimer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var speed_multiplier = $Player.current_speed / 50 + 1.0
	get_tree().set_group("lasers", "speed_multiplier", speed_multiplier)
	get_tree().call_group("enemies", "move_toward_player", $Player.position)

func _on_player_shot_laser():
	var laser = laser_scene.instantiate()
	laser.position = $Player.position
	laser.rotation = $Player.rotation
	# Move laser in front of the ship
	laser.move_local_y(-20)
	$Lasers.add_child.call_deferred(laser)


func _on_enemy_spawn_timer_timeout():
	var enemy = enemy_scene.instantiate()
	enemy.position = $Player.position + Vector2(_enemy_spawn_safe_distance, 0).rotated(randf_range(0, 2 * PI))
	add_child.call_deferred(enemy)
