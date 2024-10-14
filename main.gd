extends CharacterBody2D 

var speed = 200  
var direction = Vector2.ZERO  


func _ready() -> void:
	
	position = Vector2(512, 384)

# Called every frame
func _process(delta: float) -> void:
	# Reset movement direction to zero
	direction = Vector2.ZERO

	# Handle input and update direction and animations
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
		if not $AnimationPlayer.is_playing() or $AnimationPlayer.current_animation != "walk_right":
			$AnimationPlayer.play("walk_right")
	elif Input.is_action_pressed("ui_left"):
		direction.x -= 1
		if not $AnimationPlayer.is_playing() or $AnimationPlayer.current_animation != "left_walk":
			$AnimationPlayer.play("left_walk")
	elif Input.is_action_pressed("ui_down"):
		direction.y += 1
		if not $AnimationPlayer.is_playing() or $AnimationPlayer.current_animation != "backward":
			$AnimationPlayer.play("backward")
	elif Input.is_action_pressed("ui_up"):
		direction.y -= 1
		if not $AnimationPlayer.is_playing() or $AnimationPlayer.current_animation != "forward":
			$AnimationPlayer.play("forward")
	else:
		# If no input, play idle animation
		if not $AnimationPlayer.is_playing() or $AnimationPlayer.current_animation != "idle":
			$AnimationPlayer.play("idle")

	# Move the player according to the direction
	position += direction.normalized() * speed * delta
