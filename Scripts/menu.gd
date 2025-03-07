extends Control

@onready var mainScreen = $MainScreen
@onready var creditsScreen = $Credits
@onready var optionsScreen = $Options

#Play button
func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/game.tscn")


#Options button
func _on_options_pressed() -> void:
	mainScreen.visible = false
	optionsScreen.visible = true


#Quit button
func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_credits_pressed() -> void:
	mainScreen.visible = false
	creditsScreen.visible = true


func _on_back_pressed() -> void:
	mainScreen.visible = true
	optionsScreen.visible = false
	creditsScreen.visible = false


func _on_volume_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(0, value)


func _on_resolution_item_selected(index: int) -> void:
	match index:
		0:
			DisplayServer.window_set_size(Vector2i(1920, 1080))
		1:
			DisplayServer.window_set_size(Vector2i(1280, 720))
		2:
			DisplayServer.window_set_size(Vector2i(800, 600))
