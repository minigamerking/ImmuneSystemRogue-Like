extends CharacterBody2D


const SPEED = 600

func _physics_process(delta):
	# Add the gravity.
	# Handle jump.

	var direction_x = Input.get_axis("left", "right")
	var direction_y = Input.get_axis("up","down")
	if direction_x or direction_y:
		velocity.x = direction_x * SPEED
		velocity.y = direction_y *SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y,0,SPEED)

	move_and_slide()
