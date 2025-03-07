extends Control

@onready var scorelabel = $Border/MarginContainer/BG/VBoxContainer/score

func show_screen(score):
	$"../score".visible = false
	scorelabel.text = str(score)
	$"../AnimationPlayer".play("ending_screen")


func _on_play_again_pressed() -> void:
	get_tree().reload_current_scene()


func _on_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/menu.tscn") 
