extends CharacterBody2D
class_name Player
const PROJECTILE = preload("res://Scenes/projectile.tscn")

const SPEED = 600
var can_shoot = true
@onready var sprite_2d = $Sprite2D

func _physics_process(delta):
	# Add the gravity.
	# Handle jump.

	var direction = Input.get_vector("left","right","up","down")
	velocity = velocity.lerp(direction * SPEED, 0.075)

	move_and_slide()


func _process(delta):
	if Input.is_action_pressed("leftclick") and can_shoot:
		var newprojectile = PROJECTILE.instantiate()
		newprojectile.global_position = global_position
		newprojectile.direction = -(position - get_global_mouse_position()).normalized()
		get_parent().add_child(newprojectile)
		can_shoot = false
		$projectilecd.wait_time = Playermanager.fire_speed
		$projectilecd.start()
	

func _ready():
	match Floormanager.floor_id:
		2:
			sprite_2d.texture =preload("res://sprites/Platelets _enemy.png")

func _on_projectilecd_timeout():
	can_shoot = true
