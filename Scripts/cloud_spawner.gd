extends Node2D

var obstacle = preload("res://Scenes/cloud.tscn") 

@onready var obstacle_spawn_timer: Timer = $ObstacleSpawnTimer

var active = false

func start() -> void:
	if not active:
		active = true
		obstacle_spawn_timer.start(4)

func _on_obstacle_spawn_timer_timeout() -> void:
	if active:
		var instance = obstacle.instantiate()
		add_child(instance)
	obstacle_spawn_timer.set_wait_time(randf_range(3.0, 7.0))
