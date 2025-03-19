extends Node2D

@export var obstacle_speed := 7

func _ready() -> void:
	position += Vector2.UP * (randi() % 400)


func _physics_process(_delta: float) -> void:
	position += Vector2.LEFT * obstacle_speed
