extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var score := 0
var alive := true

var game_started = false

func start_game():
	game_started = true
	velocity.y = JUMP_VELOCITY

func _physics_process(delta: float) -> void:
	if !game_started: 
		return
	
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	if alive and Input.is_action_just_pressed("jump"):
		velocity.y = JUMP_VELOCITY
	
	velocity.x = 0
	
	move_and_slide()
	
	if not alive:
		rotation += 0.15

func _on_area_2d_area_entered(area: Area2D) -> void:
	if alive:
		if area.get_groups()[0] == "point":
			score += 1
		elif area.get_groups()[0] == "enemy":
			game_over()

func game_over() -> void:
	alive = false
	velocity.y = JUMP_VELOCITY
	print("YOU DIED with a score of "+str(score))
	
