extends Node2D

var game_started = false
var score = 0

@onready var scorelabel = $CanvasLayer/score

func _ready() -> void:
	$CanvasLayer/AnimationPlayer.play("start_text")

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("jump") and !game_started:
		game_started = true
		$Player.start_game()
		$ObstacleSpawner.start()
		$CloudSpawner.start()
		$CanvasLayer/start_text.visible = false
		$CanvasLayer/AnimationPlayer.play("fade_in")
		$CanvasLayer/pause_menu.game_start()


func add_score():
	score+=1
	scorelabel.text = str(score)
