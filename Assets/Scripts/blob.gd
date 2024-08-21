extends CharacterBody2D



const JUMP_VELOCITY = -130
@onready var animate = $AnimatedSprite2D

var gravity = 380.5

# It is will check whether the last frame was on floor
var was_on_floor = true



func _physics_process(delta):



	if not is_on_floor():
		velocity.y += gravity * delta
		if Input.is_action_just_pressed("Duck") and GameManager.player_alive == true:
			velocity.y = -1 * 2 * JUMP_VELOCITY
	else:
		animate.play("Idle")
	
	# As the player has jumped now and was on the floor in previous frame, this will run
	if not is_on_floor() and was_on_floor:
		animate.play("Jump")
	
	# And now the last frame will become as the latest frame. As soon it turns to true, the above code will run.
	was_on_floor = is_on_floor()
	
	if GameManager.player_alive == true:
		# Recording the distance covered by the player only if player alive.
		GameManager.distanceCovered()
		if Input.is_action_just_pressed("Jump") and is_on_floor():
			velocity.y = JUMP_VELOCITY
		move_and_slide()

func game_over():
	GameManager.player_alive = false


