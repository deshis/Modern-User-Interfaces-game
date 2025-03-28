extends Control

var game_ongoing = false

func game_start(): game_ongoing = true


func game_end(): game_ongoing = false


func resume():
	visible = false
	get_tree().paused = false


func pause():
	visible = true
	get_tree().paused = true


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_menu_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/menu.tscn") 


func _on_resume_pressed() -> void:
	resume()


func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("pause") && game_ongoing:
		@warning_ignore("standalone_ternary")
		resume() if get_tree().paused else pause()
