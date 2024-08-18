extends CharacterBody2D
class_name Player
const PROJECTILE = preload("res://Scenes/projectile.tscn")

const SPEED = 600
var can_shoot = true
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


func _process(delta):
	if Input.is_action_pressed("shootdown") and can_shoot:
		var newprojectile = PROJECTILE.instantiate()
		newprojectile.global_position =self.global_position
		newprojectile.direction= Vector2(0,1)
		get_parent().add_child(newprojectile)
		can_shoot=false
	elif Input.is_action_pressed("shootup") and can_shoot:
		var newprojectile = PROJECTILE.instantiate()
		newprojectile.global_position =self.global_position
		newprojectile.direction= Vector2(0,-1)
		get_parent().add_child(newprojectile)
		can_shoot=false
	elif Input.is_action_pressed("shootright")and can_shoot:
		var newprojectile = PROJECTILE.instantiate()
		newprojectile.global_position =self.global_position
		newprojectile.direction= Vector2(1,0)
		get_parent().add_child(newprojectile)
		can_shoot=false
	elif Input.is_action_pressed("shootleft") and can_shoot:
		var newprojectile = PROJECTILE.instantiate()
		newprojectile.global_position =self.global_position
		newprojectile.direction= Vector2(-1,0)
		get_parent().add_child(newprojectile)
		can_shoot=false


func _on_projectilecd_timeout():
	can_shoot = true
