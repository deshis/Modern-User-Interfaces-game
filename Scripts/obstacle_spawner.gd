extends Node2D

var obstacle = preload("res://Scenes/obstacle.tscn") 

@onready var obstacle_spawn_timer: Timer = $ObstacleSpawnTimer

@export var obstacle_delay := 1.0

var active = false

func start() -> void:
	if not active:
		active = true
		obstacle_spawn_timer.start(obstacle_delay)

func _on_obstacle_spawn_timer_timeout() -> void:
	if active:
		var instance = obstacle.instantiate()
		add_child(instance)
	
