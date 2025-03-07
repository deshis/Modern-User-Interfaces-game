extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var score := 0
var alive := true

var game_started = false

@onready var jump_audio_stream_player: AudioStreamPlayer2D = $JumpAudioStreamPlayer
@onready var point_audio_stream_player: AudioStreamPlayer2D = $PointAudioStreamPlayer
@onready var death_audio_stream_player: AudioStreamPlayer2D = $DeathAudioStreamPlayer


func _ready() -> void:
	velocity.y = JUMP_VELOCITY


func start_game():
	game_started = true
	if alive: #???
		jump_audio_stream_player.play()


func _physics_process(delta: float) -> void:
	if !game_started: 
		return
	
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	if alive and Input.is_action_just_pressed("jump"):
		velocity.y = JUMP_VELOCITY
		jump_audio_stream_player.play()
	
	velocity.x = 0
	
	move_and_slide()
	
	if not alive:
		rotation += 0.15


func _on_area_2d_area_entered(area: Area2D) -> void:
	if alive:
		if area.get_groups()[0] == "point":
			score += 1
			point_audio_stream_player.play()
			get_parent().add_score()
		elif area.get_groups()[0] == "enemy":
			game_over()


func game_over() -> void:
	death_audio_stream_player.play()
	alive = false
	velocity.y = JUMP_VELOCITY
	$"../CanvasLayer/pause_menu".game_end()
	$"../CanvasLayer/ending_screen".show_screen(score)
