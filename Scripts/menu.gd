extends Control

@onready var mainScreen = $MainScreen
@onready var creditsScreen = $Credits

#Play button
func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/game.tscn")


#Options button
func _on_options_pressed() -> void:
	pass 


#Quit button
func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_credits_pressed() -> void:
	mainScreen.visible = false
	creditsScreen.visible = true


func _on_back_pressed() -> void:
	mainScreen.visible = true
	creditsScreen.visible = false
