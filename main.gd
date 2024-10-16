extends CharacterBody2D

# Speed of the player
@export var speed: int = 80

# Physics process to handle movement
func _physics_process(delta: float) -> void:
	# Input vector for movement
	var input_vector = Vector2.ZERO

	# Get input for movement on the X and Y axes
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")

	# Normalize the input vector to avoid faster diagonal movement
	input_vector = input_vector.normalized()

	# Move the character using move_and_slide()
	velocity = input_vector * speed
	move_and_slide()

	# Play the correct animation based on movement direction
	if input_vector.x > 0:
		$AnimationPlayer.play("walk_right")
	elif input_vector.x < 0:
		$AnimationPlayer.play("left_walk")
	elif input_vector.y > 0:
		$AnimationPlayer.play("forward")
	elif input_vector.y < 0:
		$AnimationPlayer.play("backward")
	else:
		
		$AnimationPlayer.stop()
