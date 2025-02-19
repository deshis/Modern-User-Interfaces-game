extends Node2D

@export var obstacle_speed := 3

func _ready() -> void:
	position += Vector2.UP * (randi() % 400)

func _process(_delta: float) -> void:
	position += Vector2.LEFT * obstacle_speed
