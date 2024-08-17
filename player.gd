extends CharacterBody2D


const SPEED = 300.0
const D_SPEED = 10000.0
var can_dash = true

func _physics_process(delta):
	# Add the gravity.
	# Handle jump.

	var direction_x = Input.get_axis("left", "right")
	var direction_y = Input.get_axis("up","down")
	if direction_x or direction_y:
		if Input.is_action_just_pressed("dash") and can_dash:
			#cooldown does not work, need fixing
			can_dash = false
			velocity.x = direction_x * D_SPEED
			velocity.y = direction_y *D_SPEED
			$Dash_cooldown.start()
		else:
			velocity.x = direction_x * SPEED
			velocity.y = direction_y *SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y,0,SPEED)
	
	move_and_slide()

func _on_dash_cooldown_timeout():
	$Dash_cooldown.stop()
	can_dash = true
