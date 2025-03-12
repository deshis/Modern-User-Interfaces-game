extends Node2D

@onready var sprite_2d: Sprite2D = $Sprite2D

var cloud_speed:float

func _ready() -> void:
	
	var textures := [load("res://Resources/Textures/cloud1.png"), load("res://Resources/Textures/cloud2.png"), load("res://Resources/Textures/cloud3.png")]
	sprite_2d.set_texture(textures[randi_range(0, 2)])
	
	var cloud_size := randf_range(0.8, 1.2)
	sprite_2d.set_scale(Vector2(cloud_size,cloud_size))
	
	cloud_speed = randf_range(0.8, 1.8)
	position += Vector2.UP * (randi() % 300)


func _process(_delta: float) -> void:
	position += Vector2.LEFT * cloud_speed
