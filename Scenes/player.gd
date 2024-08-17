extends CharacterBody2D

var facing_up = false
var facing_down = false
var facing_right = false
var facing_left = false
const SPEED = 600
const PROJECTILE = preload("res://Scenes/projectile.tscn")
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
	if Input.is_action_just_pressed("shoot"):
		var new_projectile = PROJECTILE.instantiate()
		if direction_x or direction_y:
			new_projectile.direction = Vector2(direction_x,direction_y)
		else:
			if facing_up ==true:
				new_projectile.direction =Vector2(0,-1)
			elif facing_down ==true:
				new_projectile.direction =Vector2(0,1)
			if facing_left ==true:
				new_projectile.direction =Vector2(-1,0)
			if facing_right ==true:
				new_projectile.direction =Vector2(1,0)
		get_parent().add_child(new_projectile)
		new_projectile.global_position = self.global_position

	move_and_slide()
func _process(delta):
	if Input.is_action_just_pressed("up"):
		facing_up = true
		facing_down = false
		facing_right = false
		facing_left = false
		
	if Input.is_action_just_pressed("left"):
		facing_up = false
		facing_down = false
		facing_right = false
		facing_left = true
	if Input.is_action_just_pressed("right"):
		facing_up = false
		facing_down = false
		facing_right = true
		facing_left = false
	if Input.is_action_just_pressed("down"):
		facing_up = false
		facing_down = true
		facing_right = false
		facing_left = false
