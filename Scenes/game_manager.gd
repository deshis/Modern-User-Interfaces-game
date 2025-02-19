extends Node2D

var game_started = false

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("jump"):
		game_started = true
		$Player.start_game()
		$ObstacleSpawner.start()
		$CanvasLayer/MarginContainer/start_text.visible = false
