extends CharacterBody2D
class_name Player
const PROJECTILE = preload("res://Scenes/projectile.tscn")

const SPEED = 600
var can_shoot = true

@onready var sprite_2d = $Sprite2D

const D_SPEED = 10000
var can_dash = true
var dash_time = 6



func _physics_process(delta):
	# Add the gravity.
	# Handle jump.

 
	var direction = Input.get_vector("left","right","up","down")
	velocity = velocity.lerp(direction * SPEED, 0.075)

#	if direction_x or direction_y:
#		if Input.is_action_just_pressed("dash") and can_dash:
#			dash_time -= delta
#			velocity.x = direction_x * D_SPEED * delta
#			velocity.y = direction_y *D_SPEED * delta
#			print("dash")
#			can_dash = false
#			$Dash_cooldown.start()
#		else:
#			velocity.x = direction_x * SPEED
#			velocity.y = direction_y *SPEED
#	else:
#		velocity.x = move_toward(velocity.x, 0, SPEED)
#		velocity.y = move_toward(velocity.y,0,SPEED)


	move_and_slide()


func _process(delta):
	if Input.is_action_pressed("leftclick") and can_shoot:
		var newprojectile = PROJECTILE.instantiate()
		newprojectile.global_position = global_position
		newprojectile.direction = -(position - get_global_mouse_position()).normalized()
		get_parent().add_child(newprojectile)
		can_shoot = false
		$projectilecd.start()
	



func _on_projectilecd_timeout():
	can_shoot = true
	
func _on_dash_cooldown_timeout():
	can_dash = true
