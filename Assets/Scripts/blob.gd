extends CharacterBody2D


#const SPEED = 300.0
const JUMP_VELOCITY = -150.5

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = 380.5
var is_collided = null


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		if Input.is_action_just_pressed("Duck"):
			velocity.y = -1 * 2 * JUMP_VELOCITY

	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	move_and_slide()



