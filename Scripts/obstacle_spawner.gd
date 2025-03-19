extends Node2D

var obstacle = preload("res://Scenes/obstacle.tscn") 

@onready var obstacle_spawn_timer: Timer = $ObstacleSpawnTimer

var active = false

var obstacle_spawn_time := 1.1

func start() -> void:
	if not active:
		active = true
		obstacle_spawn_timer.start(obstacle_spawn_time)


func _on_obstacle_spawn_timer_timeout() -> void:
	if active:
		var instance = obstacle.instantiate()
		add_child(instance)
